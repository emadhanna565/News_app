import 'package:flutter/material.dart';
import 'package:news_app/layout/home/home_layout.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "Splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.asset(
            'assets/images/splash_image.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
