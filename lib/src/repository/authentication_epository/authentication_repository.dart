import 'package:CMI/Screens/apphome.dart';
import 'package:CMI/src/features/authentication/screens/login/login_or_register.dart';
import 'package:CMI/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:CMI/src/features/core/screens/dashboard/dashboard.dart';
import 'package:CMI/src/repository/authentication_epository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'dart:async';
import '../../../main.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  // late final Stream<User?> firebaseUser;

  @override
  void onReady() {
    // firebaseUser = User?(_auth.currentUser);
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginOrRegister())
        : Get.offAll(() => const Dashboard());
  }

  FutureOr<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const LoginOrRegister());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  FutureOr<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == "invalid phone number") {
          Get.snackbar('Error', "The previous phone number is not valid");
        } else {
          Get.snackbar("Error", 'Something went wrong, try again');
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  FutureOr<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  FutureOr<void> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  FutureOr<void> logout() async => await _auth.signOut();
}
