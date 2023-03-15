import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app_testing/src/features/authentication/controllers/firebase_exceptions.dart';
class AuthenticationService {
  static final _auth = FirebaseAuth.instance;
  static late AuthStatus _status;

  Future<AuthStatus> createAccount({
    required String email,
    required String password,
    required String name,
  }) async{
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
      _auth.currentUser! .updateDisplayName(name);
      newUser.user!.sendEmailVerification();
      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    }
    return _status;
  }

  Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _status = AuthStatus.successful;
    } on FirebaseAuthException catch(e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    }
    return _status;
  }

  Future <AuthStatus> resetPassword({required String email}) async{
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  //Google Sign In

  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn().catchError((onError) {
      print("Error $onError");
    });
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}


