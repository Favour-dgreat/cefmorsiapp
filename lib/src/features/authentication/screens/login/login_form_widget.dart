import 'package:CMI/src/constants/sizes.dart';
import 'package:CMI/src/constants/text_strings.dart';
import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: HexColor("#309C96"),
                  ),
                  labelText: "E-mail address",
                  hintText: "E-mail address",
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: HexColor("#309C96"),
                ),
                labelText: "Password",
                hintText: "Password",
                border: const OutlineInputBorder(),
                suffixIcon: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor("#FA172C"),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      HexColor("#309C96"),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    "Sign In".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
