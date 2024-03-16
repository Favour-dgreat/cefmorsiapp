import 'package:flutter/material.dart';
import '../../controllers/auth_service.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cefmorsi.png'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hi $AuthenticationService _auth.currentUser! .updateDisplayName(name)',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to your profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: $AuthenticationService.auth.currentUser!.email}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
