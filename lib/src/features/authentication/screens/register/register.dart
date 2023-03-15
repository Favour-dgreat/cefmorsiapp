import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/src/common_widgets/square_tile.dart';
import 'package:flutter_app_testing/src/features/authentication/controllers/auth_service.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/my_textfield.dart';
import '../../../../common_widgets/snack_bar.dart';
import '../../../../constants/image_strings.dart';
import '../../../../utils/loader.dart';
import '../../controllers/firebase_exceptions.dart';
import '../login/login.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'signup_screen';
  final Function()? onTap;
  const RegisterPage({Key? key, this.onTap,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthenticationService();
  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'Sign Up',
                style: TextStyle(
                    color: HexColor("#1E1E1E"),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _nameController,
                obscureText: false,
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.edit,color: HexColor("#309c96"), ),
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
                  hintText:("Full Name"),
                ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _emailController,
                obscureText: false,
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.email, color: HexColor("#309c96"),),
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
                  hintText:("E-mail address"),
                ),
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: _passwordController,
                obscureText: true,
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.key_outlined, color: HexColor("#309c96"),),
                  enabledBorder:OutlineInputBorder(
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
                    suffixIcon: Icon(Icons.visibility_off),)
                ),


              //Confirm password
              const SizedBox(height: 10),

              MyTextField(
                controller: _passwordController,
                obscureText: true,
                 decoration:  InputDecoration(
                     prefixIcon: Icon(Icons.key_outlined, color: HexColor("#309c96"),),
                   enabledBorder:OutlineInputBorder(
                     borderRadius: BorderRadius.circular(40.0),
                     borderSide: const BorderSide(color: Colors.white),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.grey.shade400),
                     borderRadius: BorderRadius.circular(40.0),
                   ),
                   fillColor: Colors.grey.shade200,
                   filled: true,
                   hintText: ("Confirm Password"),
                   suffixIcon: Icon(Icons.visibility_off),)

              ),
              const SizedBox(height: 10),

              const SizedBox(height: 25),
              MyButton(
                text: "Create Account",
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    LoaderX.show(context);
                    final _status = await _authService.createAccount(
                      email: _emailController.text.trim(),
                      password: _passwordController.text,
                      name: _nameController.text,
                    );

                    if (_status == AuthStatus.successful) {
                      LoaderX.hide();
                      Navigator.pushNamed(context, LoginScreen.id);
                    } else {
                      LoaderX.hide();
                      final error =
                      AuthExceptionHandler.generateErrorMessage(
                          _status);
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
                      child: Divider(thickness: 1.5, color: HexColor("#309c96"),),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or'),
                    ),
                    Expanded(
                      child: Divider(thickness: 1.5, color: HexColor("#309c96"),),
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
                SquareTile(onTap: () {}, imagePath: 'assets/images/apple.png')
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
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
