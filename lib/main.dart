import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news24/utlis/colors.dart';
import 'package:news24/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,

        ),
scaffoldBackgroundColor: Colors.white,

      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}


