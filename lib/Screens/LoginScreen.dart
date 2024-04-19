import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Models/Customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/DBHelper.dart';
import '../Models/Category.dart';
import 'DashBoardScreen.dart';
import 'ForgotPasswordScreen.dart';
import 'RegisterScreen.dart';
import 'SquareTile.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Customer customer;
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
            textInputField("EmailAddress",emailController,false),
            spaceInBetweenWidgets(10),
            textInputField("Password",passwordController,true),
            spaceInBetweenWidgets(10),
            textField("Forgot Password?"),
            spaceInBetweenWidgets(20),
            signInButton(emailController,passwordController),
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

  Widget textInputField(String email,TextEditingController textEditingController, bool value) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        obscureText: value,
        controller: textEditingController,
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
    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()));
        });
      },
      child: Padding(
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
      ),
    );
  }

  Widget signInButton(TextEditingController emailController, TextEditingController passwordController) {
    return GestureDetector(
      onTap: (){

        var email = emailController.text;
        var password = passwordController.text;


        if (email.isEmpty && password.isEmpty){
          print("Please Enter Email and Password");
        } else {

          setState(() async {
            this.customer = await DBHelper.instance.performLoginValidation(email,password);
            if(customer != null) {

              SharedPreferences mSharedPreference = await SharedPreferences.getInstance();
              mSharedPreference.setString("EMAIL",email);
              mSharedPreference.setString("PASSWORD",password);

              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "FRUITS"));
              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "VEGETABLES"));
              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "MILK"));
              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "MEAT"));
              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "SNACKS"));
              DBHelper.instance.insertCategoryDetails(const Category(categoryName: "RICE"));


              Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoardScreen()));
            }
          });
        }



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
