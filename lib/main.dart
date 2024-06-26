import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Screens/SplashScreen.dart';

import 'Screens/LoginScreen.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoginScreen",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: SplashScreen(),
    );
  }
}
