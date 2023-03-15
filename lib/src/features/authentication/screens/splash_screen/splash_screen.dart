import 'package:flutter/material.dart';
import 'package:flutter_app_testing/src/constants/image_strings.dart';
import 'package:flutter_app_testing/src/constants/sizes.dart';
import 'package:flutter_app_testing/src/constants/text_strings.dart';

import '../../../../constants/colors.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
        const Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Image(
                image: AssetImage(tSplashTopIcon),
          ),
            ),
          ),
          Positioned(
          top: 80,
          left: tDefaultSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tAppName, style: Theme.of(context).textTheme.headline2,),
            Text(tAppTagLine, style: Theme.of(context).textTheme.headline3,)
            ],
          ),
          ),
          const Positioned(
            bottom: 100,
            child: Image(image: AssetImage(tSplashTopIcon),),
          ),
          Positioned(
            bottom: 40,
            right: tDefaultSize,
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              )
            )
          )
        ]
      ),
    );
  }
}
