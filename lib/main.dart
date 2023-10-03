import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:CMI/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:CMI/src/repository/authentication_epository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/routes.dart';
import 'package:CMI/src/features/authentication/screens/login/login.dart';
import 'package:CMI/src/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      themeMode: ThemeMode.system,
      initialRoute: LoginScreen.id,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
