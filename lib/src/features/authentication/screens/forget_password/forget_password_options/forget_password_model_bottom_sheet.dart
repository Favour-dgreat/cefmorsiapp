import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:CMI/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:CMI/src/features/authentication/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordScreen {
  static FutureOr<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.displaySmall),
            Text(tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: tEmail,
              subTitle: tResetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhone,
              subTitle: tResetViaPhone,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
