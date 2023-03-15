import 'package:flutter/material.dart';
import 'package:flutter_app_testing/Screens/dashboard.dart';
import 'package:flutter_app_testing/Screens/routes.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/login/auth_page.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/login/login.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter_app_testing/src/utils/theme.dart';
import 'Screens/apphome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: LoginScreen.id,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
