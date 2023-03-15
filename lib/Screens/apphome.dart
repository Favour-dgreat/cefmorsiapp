import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/src/utils/theme.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout_sharp),)],),
      body: Center(
        child: Text("Logged In as:${user.email!}"),
      ),

    );
  }
}
