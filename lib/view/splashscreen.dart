import 'package:bookit_user_app/view/onboarding_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoardingScreen();
  }

  navigateToOnBoardingScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offAll(OnBoardingVideoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo/bookit.png',
          width: 300,
        ),
      ),
    );
  }
}
