import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'IntroScreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  IntroScreens()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: FlutterLogo(size: MediaQuery.of(context).size.height,),
    );
  }
}
