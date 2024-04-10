import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  var isEnabledValueForFirstName = false;
  var isEnabledValueForLastName = false;
  var isEnabledValueForMobileNumber = false;
  var isEnabledValueForEmailAddress = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      enabled: isEnabledValueForFirstName,
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        hintText: "Display First Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isEnabledValueForFirstName = true;
                          });
                        },
                        child: Icon(Icons.edit)))
              ],
            ),
          ),

          const SizedBox(height: 15,),


          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      enabled: isEnabledValueForLastName,
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        hintText: "Display Last Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isEnabledValueForLastName = true;
                          });
                        },
                        child: Icon(Icons.edit)))
              ],
            ),
          ),

          const SizedBox(height: 15,),

          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      enabled: isEnabledValueForMobileNumber,
                      controller: mobileNumberController,
                      decoration: const InputDecoration(
                        hintText: "Display MobileNumber",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isEnabledValueForMobileNumber = true;
                          });
                        },
                        child: Icon(Icons.edit)))
              ],
            ),
          ),


          const SizedBox(height: 15,),

          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      enabled: isEnabledValueForEmailAddress,
                      controller: emailAddressController,
                      decoration: const InputDecoration(
                        hintText: "Display EmailAddress",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isEnabledValueForEmailAddress = true;
                          });
                        },
                        child: Icon(Icons.edit)))
              ],
            ),
          ),

          const SizedBox(height: 30,),

          GestureDetector(
            onTap: (){
              setState(() {

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
                    "UPDATE",
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
