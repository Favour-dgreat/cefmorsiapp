import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/src/common_widgets/square_tile.dart';
import 'package:flutter_app_testing/src/features/authentication/controllers/auth_service.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/register/register.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/my_textfield.dart';
import '../../../../common_widgets/snack_bar.dart';
import '../../../../constants/image_strings.dart';
import 'package:flutter_app_testing/src/common_widgets/checkbox.dart';

import '../../../../utils/loader.dart';
import '../../controllers/firebase_exceptions.dart';
import '../Reset_Password/reset_password.dart';
import '../welcome/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key, required void Function() onTap, required Null Function(dynamic bool) callback}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthenticationService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage(tAuthLogo),
              ),
              const SizedBox(height: 50),
              Text(
                'Sign In',
                style: TextStyle(
                    color: HexColor("#1E1E1E"),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: _emailController,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: HexColor("#309C96")),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: ("Email address"),
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: _passwordController,
                obscureText: _passwordInVisible,
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.key_rounded, color: HexColor("#309C96")),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: ("Password"),
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
                    suffixIcon: Icon(_passwordInVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed:(){
                      setState((){
                        _passwordInVisible = !_passwordInVisible;
                      })
                    }),
              ),
              SizedBox(height: 10),
              // Checkbox(
              //   activeColor: Color(0xff00C8E8),
              //   value: _isChecked,
              //   onChanged: _handleRememberme
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ResetPasswordScreen.id),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 0.0),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 15,
                          color: HexColor("#FA172C"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              MyButton(
                text: "Sign in",
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    LoaderX.show(context);
                    final _status = await _authService.login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text,
                    );

                    if (_status == AuthStatus.successful) {
                      LoaderX.hide();
                      Navigator.pushNamed(context, HomeScreen.id);
                    } else {
                      LoaderX.hide();
                      final error =
                      AuthExceptionHandler.generateErrorMessage(_status);
                      CustomSnackBar.showErrorSnackBar(
                        context,
                        message: error,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or Continue with'),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SquareTile(
                  onTap: () => AuthenticationService().signInWithGoogle(),
                  imagePath: 'assets/images/gg.png',
                ),
                const SizedBox(width: 10),
                SquareTile(
                  imagePath: 'assets/images/apple.png',
                  onTap: () {},
                )
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RegisterPage.id),
                    child: Text(
                      'Register now',
                      style: TextStyle(
                          color: HexColor("#309C96"),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


