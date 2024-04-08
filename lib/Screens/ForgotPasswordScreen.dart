
import 'package:flutter/material.dart';

import 'ChangePasswordScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          textInputField("Enter Email Address"),

          const SizedBox(height: 25,),

          forgotPasswordButton(context)



        ],
      ),
    );
  }
}

Widget textInputField(String email) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: TextField(
      decoration: InputDecoration(
          hintText: email,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          fillColor: Colors.grey.shade200,
          filled: true),
    ),
  );
}

Widget forgotPasswordButton(BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context , MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
    },
    child: Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "FORGOT PASSWORD",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    ),
  );
}