import 'package:flutter/material.dart';
import 'package:news_app/layout/home/home_layout.dart';
import 'package:news_app/screens/splash/splash_screen.dart';
import 'package:news_app/shared/style/theme/myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeLayout.routeName: (_) => HomeLayout(),
      },
    );
  }
}
