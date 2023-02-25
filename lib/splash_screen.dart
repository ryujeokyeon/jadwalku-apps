import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
        title: const Text(
          'atur jadwalmu yang gak\nseberapa itu!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: biru,
        logo: Image.asset(
          'assets/notes.png',
        ),
        showLoader: true,
        loaderColor: Colors.white,
        navigator: const LoginPage(),
        durationInSeconds: 5);
  }
}
