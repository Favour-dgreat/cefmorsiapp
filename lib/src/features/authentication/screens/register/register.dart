import 'package:CMI/src/features/authentication/controllers/signup_controller.dart';
import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:CMI/src/common_widgets/square_tile.dart';
import 'package:CMI/src/features/authentication/controllers/auth_service.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/my_textfield.dart';
import '../../../../common_widgets/snack_bar.dart';
import '../../../../constants/image_strings.dart';
import '../../../../utils/loader.dart';
import '../../controllers/firebase_exceptions.dart';
import '../../controllers/signup_controller.dart';
import '../login/login.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'signup_screen';
  final Function()? onTap;
  const RegisterPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthenticationService();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Image(
                    image: AssetImage(tAuthLogo),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: HexColor("#1E1E1E"),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.edit,
                          color: HexColor("#309c96"),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Full Name"),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _phoneController,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: HexColor("#309c96"),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Phone Number"),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: HexColor("#309c96"),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("E-mail address"),
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.key_rounded, color: HexColor("#309C96")),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Password"),
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.key_rounded, color: HexColor("#309C96")),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Confirm Password"),
                        hintStyle: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelText: 'Confirm Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MyButton(
                      text: "Create Account",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                              _emailController.text.trim(),
                              _passwordController.text.trim());
                          SignUpController.instance.phoneAuthentication(
                              _phoneController.text.trim());
                          Get.to(() => const OTPScreen());
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: HexColor("#309c96"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: HexColor("#309c96"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: OutlinedButton.icon(
                      icon: const Image(
                        image: AssetImage(tGoogleLogoImage),
                        width: 20.0,
                      ),
                      onPressed: () {},
                      label: const Text("Sign-in with Google"),
                    ),
                  ),
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
                        onTap: () =>
                            Navigator.pushNamed(context, LoginScreen.id),
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
        ),
      ),
    );
  }
}
