//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Image.asset(
              ImagesConstants.splashTop,
              height: getVerticalSize(200.0),
              fit: BoxFit.fitWidth,
            )),
        Center(
          child: SvgPicture.asset(
            ImagesConstants.splashWelcome,
            height: getVerticalSize(181.0),
            width: getHorizontalSize(328.0),
          ),
        ),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Image.asset(
              ImagesConstants.splashBottom,
              height: getVerticalSize(200.0),
              fit: BoxFit.fitWidth,
            )),
      ],
    ));
  }
}