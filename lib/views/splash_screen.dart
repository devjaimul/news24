




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news24/utlis/colors.dart';

import 'home screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1 ;

    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash_pic.jpg',
            fit: BoxFit.cover,
            height:  height * .5,
          ),
          SizedBox(height: height * 0.04,),
          const Text('TOP HEADLINES' ,),
          SizedBox(height: height * 0.04,),
          SpinKitChasingDots(
            color: AppColors.primaryColor ,
            size: 40,
          )

        ],
      ),
    );
  }
}