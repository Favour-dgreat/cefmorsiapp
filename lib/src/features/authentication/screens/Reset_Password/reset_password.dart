import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_app_testing/src/common_widgets/square_tile.dart';
import 'package:flutter_app_testing/src/features/authentication/controllers/auth_service.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/my_textfield.dart';
import '../../../../common_widgets/snack_bar.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/custom_button.dart';
import '../../../../constants/image_strings.dart';
import 'package:flutter_app_testing/src/common_widgets/checkbox.dart';

import '../../../../utils/loader.dart';
import '../../../../utils/validator.dart';
import '../../controllers/firebase_exceptions.dart';
import '../login/login.dart';
class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authService = AuthenticationService();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 50.0, bottom: 25.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child:  Icon(Icons.arrow_back, color: HexColor("#309C96"),),
                ),
                const SizedBox(height: 70),
                Center(child: Icon(Icons.lock, size: 150, color: HexColor("#309C96"),)),
                const SizedBox(height: 10),
                const Text(
                  'Provide your email below so we can send you a password reset code.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email address',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  controller: _emailController,
                  validator: (value) => Validator.validateEmail(value ?? ""), decoration: null,
                ),
                const SizedBox(height: 16),
                const Expanded(child: SizedBox()),
                CustomButton(
                  label: 'RECOVER PASSWORD',
                  color: Colors.black,
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      LoaderX.show(context);
                      final _status = await _authService.resetPassword(
                          email: _emailController.text.trim());
                      if (_status == AuthStatus.successful) {
                        LoaderX.hide();
                        Navigator.pushNamed(context, LoginScreen.id);
                      } else {
                        LoaderX.hide();
                        final error =
                        AuthExceptionHandler.generateErrorMessage(_status);
                        CustomSnackBar.showErrorSnackBar(context,
                            message: error);
                      }
                    }
                  },
                  size: size,
                  textColor: Colors.white,
                  borderSide: BorderSide.none,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );


  }
}