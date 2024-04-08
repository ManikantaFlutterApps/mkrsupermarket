
import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Screens/LoginScreen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          textInputField("Enter Password",passwordController),

          const SizedBox(height: 20,),

          textInputField("Enter Confirm Password",confirmPasswordController),

          const SizedBox(height: 20,),

          updatePasswordButton(context,passwordController,confirmPasswordController),



        ],
      )
    );
  }
}

Widget textInputField(String password,TextEditingController textEditingController) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: TextField(
      controller: textEditingController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: password,
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

Widget updatePasswordButton(BuildContext context, TextEditingController passwordController, TextEditingController confirmPasswordController) {
  return GestureDetector(
    onTap: (){

      var password = passwordController.text;
      var confirmPassword = confirmPasswordController.text;

      if(password.isEmpty && confirmPassword.isEmpty) {
        print("Password and Confirm Password is Mandatory");
      } else if(password != confirmPassword) {
        print("Password and Confirm Password is Not Matched");
      }else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
            "UPDATE PASSWORD",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    ),
  );
}
