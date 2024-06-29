import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icons to light
    ));

    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo-light.svg",
              width: 170,
              height: 170,
            ),
          ],
        ),
      ),
      nextScreen: const MainScreen(),
      splashIconSize: 800,
      backgroundColor: PrimaryColor.c8,
      duration: 8000,
    );
  }
}
