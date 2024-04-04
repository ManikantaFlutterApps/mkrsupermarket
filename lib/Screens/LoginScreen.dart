import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegisterScreen.dart';
import 'SquareTile.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            addLockIcon(),
            spaceInBetweenWidgets(20),
            displayInfoMessage(),
            spaceInBetweenWidgets(20),
            textInputField("EmailAddress"),
            spaceInBetweenWidgets(10),
            textInputField("Password"),
            spaceInBetweenWidgets(10),
            textField("Forgot Password?"),
            spaceInBetweenWidgets(20),
            signInButton(),
            spaceInBetweenWidgets(20),
            addingSocialMediaLogins(),
            spaceInBetweenWidgets(20),
            signUpText()



          ],
        ),
      ),
    );
  }

  Widget addLockIcon() {
    return const Center(child: Icon(Icons.lock, size: 100));
  }

  Widget spaceInBetweenWidgets(double myHeight) {
    return SizedBox(
      height: myHeight,
    );
  }

  Widget displayInfoMessage() {
    return const Text(
      "Welcome Back you have been Missed!",
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
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

  Widget textField(String forgotPassword) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            forgotPassword,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget signInButton() {
    return GestureDetector(
      onTap: (){},
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
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget addingSocialMediaLogins() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        InkWell(
            onTap: (){},
            child: const SquareTile(imagePath: "lib/images/google.png")),

        const SizedBox(width: 20,),

        InkWell(
            onTap: (){},
            child: const SquareTile(imagePath: "lib/images/apple.png")),
      ],
    );
  }

  Widget signUpText() {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Text("Not a Member?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),

        const SizedBox(width: 5,),

        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
            },
            child: const Text("Register Now.",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16),)),

      ],
    );
  }
}
