import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mkrsupermarket/Screens/LoginScreen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController inputOneController = TextEditingController();
  TextEditingController inputTwoController = TextEditingController();
  TextEditingController inputThreeController = TextEditingController();
  TextEditingController inputFourController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Text("OTP VERIFICATION",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pinkAccent),)),

          SizedBox(height: 2,),

          Text("You Will Get OTP Via SMS",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10,color: Colors.black),),

          SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    inputFormatters:[LengthLimitingTextInputFormatter(1),],
                    controller: inputOneController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              SizedBox(width: 10,),


              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    inputFormatters:[LengthLimitingTextInputFormatter(1),],
                    controller: inputTwoController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              SizedBox(width: 10,),

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    inputFormatters:[LengthLimitingTextInputFormatter(1),],
                    controller: inputThreeController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              SizedBox(width: 10,),

              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 4,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextFormField(
                      autofocus: true,
                      inputFormatters:[LengthLimitingTextInputFormatter(1),],
                      textAlign: TextAlign.center,
                      controller: inputFourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20,),

          GestureDetector(
            onTap: (){
              setState(() {
                
                var inputOne = int.parse(inputOneController.text);
                var inputTwo = int.parse(inputTwoController.text);
                var inputThree = int.parse(inputThreeController.text);
                var inputFour = int.parse(inputFourController.text);
                
                
                if (inputOne != 0 && inputTwo != 0 && inputThree !=0 && inputFour !=0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  
                }else {
                  var snackBar = const SnackBar(content: Text('Please Enter OPT Number'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                
                
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "VERIFY OTP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
