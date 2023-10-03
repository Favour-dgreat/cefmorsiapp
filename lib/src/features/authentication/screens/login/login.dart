import 'package:CMI/src/constants/text_strings.dart';
import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:CMI/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:CMI/src/common_widgets/square_tile.dart';
import 'package:CMI/src/features/authentication/screens/register/register.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/my_textfield.dart';
import '../../../../common_widgets/snack_bar.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/auth_service.dart';
import '../../controllers/firebase_exceptions.dart';
import '../../screens/Reset_Password/reset_password.dart';
import '../../screens/welcome/welcome_screen.dart';
import '../../../../utils/loader.dart';
import '../forget_password/forget_password_options/forget_password_btn_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen(
      {Key? key,
      required void Function() onTap,
      required Null Function(dynamic bool) callback})
      : super(key: key);

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

  // ignore: unused_element
  void _login() {
    // perform login logic here

    if (_rememberPassword) {
      // save the username and password to local storage
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('username', _emailController.text);
        prefs.setString('password', _passwordController.text);
      });
    }
  }

  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _emailController.text = prefs.getString('username') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
        _rememberPassword = prefs.getBool('rememberPassword') ?? false;
      });
    });
  }

  bool _obscureText = true;
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormHeaderWidget(
                      image: tWelcomeScreenImage,
                      title: tLoginTitle,
                      subTitle: tLoginSubTitle,
                    ),
                  ],
                ),
                const LoginForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
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
                    const SizedBox(
                      height: tFormHeight - 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Get.to(() => const RegisterPage());
                      },
                      child: Text.rich(
                        TextSpan(
                            text: "Don't have an account?",
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                              TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(color: HexColor("#309C96")))
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String image, title, subTitle;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final double imageHeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image(image: AssetImage(image), height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        Text(subTitle,
            textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
