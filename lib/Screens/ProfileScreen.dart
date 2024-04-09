import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  var isEnabledValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textFormInputFieldData(
              firstNameController, "Display First Name", isEnabledValue),

          const SizedBox(height: 15,),

          textFormInputFieldData(lastNameController , "Display Last Name",isEnabledValue),

          const SizedBox(height: 15,),

          textFormInputFieldData(mobileNumberController , "Display MobileNumber",isEnabledValue),

          const SizedBox(height: 15,),

          textFormInputFieldData(emailAddressController , "Display EmailAddress",isEnabledValue),

          SizedBox(height: 15,),

        ],
      ),
    );
  }

  Widget textFormInputFieldData(TextEditingController textEditingController,
      String hintValue, bool isEnabled) {
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                enabled: isEnabled,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: hintValue,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
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
                      isEnabledValue = true;
                    });
                  },
                  child: Icon(Icons.edit)))
        ],
      ),
    );
  }
}
