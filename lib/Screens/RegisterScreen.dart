import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Database/DBHelper.dart';
import 'package:mkrsupermarket/Models/Customer.dart';

import 'OTPScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  int selectedGender = 0;

  String selectedDesignation = 'Select Designation';

  var items = [
    'Select Designation',
    'Android Developer',
    'Flutter Developer',
    'Tester',
    'AWS ADMIN',
    'DEVOPS ENGG'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addPersonIcon(),
              spaceInBetweenWidgets(5),
              textFormInputField(
                  "FirstName", TextInputType.name, false, firstNameController),
              spaceInBetweenWidgets(5),
              textFormInputField(
                  "LastName", TextInputType.name, false, lastNameController),
              spaceInBetweenWidgets(5),
              textFormInputField(
                  "Password", TextInputType.text, true, passwordController),
              spaceInBetweenWidgets(5),
              textFormInputField("MobileNumber", TextInputType.phone, false,
                  mobileNumberController),
              spaceInBetweenWidgets(5),
              textFormInputField("EmailAddress", TextInputType.emailAddress,
                  false, emailAddressController),
              spaceInBetweenWidgets(5),
              textFormFieldWithIcon("DOB", TextInputType.datetime,
                  dateOfBirthController, selectedDate),
              spaceInBetweenWidgets(5),
              genderDataInput(),
              spaceInBetweenWidgets(5),
              dropDownWithDesignation(),
              spaceInBetweenWidgets(5),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget addPersonIcon() {
    return const Center(child: Icon(Icons.person, size: 100));
  }

  Widget spaceInBetweenWidgets(double myHeight) {
    return SizedBox(
      height: myHeight,
    );
  }

  Widget textFormInputField(String inputName, TextInputType name, bool value,
      TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: controller,
        obscureText: value,
        keyboardType: name,
        decoration: InputDecoration(
            hintText: inputName,
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

  Widget textFormFieldWithIcon(String dateOfBirth, TextInputType datetime,
      TextEditingController controller, DateTime selectedDate) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: dateOfBirthController,
        keyboardType: datetime,
        decoration: InputDecoration(
            hintText: dateOfBirth,
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {
                setState(() async {
                  await selectDate(selectedDate);
                });
              },
            ),
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

  Widget genderDataInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text(
              "MALE",
              style: TextStyle(fontSize: 8),
            ),
            value: 0,
            groupValue: selectedGender,
            onChanged: (status) {
              setState(() {
                selectedGender = status!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text(
              "FEMALE",
              style: TextStyle(fontSize: 8),
            ),
            value: 1,
            groupValue: selectedGender,
            onChanged: (status) {
              setState(() {
                selectedGender = status!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("OTHERS", style: TextStyle(fontSize: 8)),
            value: 2,
            groupValue: selectedGender,
            onChanged: (status) {
              setState(() {
                selectedGender = status!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget dropDownWithDesignation() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: DropdownButton(
        isExpanded: true,
        value: selectedDesignation,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedDesignation = value!;
          });
        },
      ),
    );
  }

  Widget registerButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          var firstName = firstNameController.text;
          var lastName = lastNameController.text;
          var password = passwordController.text;
          var mobileNumber = mobileNumberController.text;
          var emailAddress = emailAddressController.text;
          var dateOfBirth = dateOfBirthController.text;
          var gender = "";
          if (selectedGender == 0) {
            gender = "Male";
          } else if (selectedGender == 1) {
            gender = "FeMale";
          } else if (selectedGender == 2) {
            gender = " Others";
          }

          final customer = Customer(
              firstName: firstName,
              lastName: lastName,
              password: password,
              mobileNumber: mobileNumber,
              emailAddress: emailAddress,
              gender: gender,
              designation: selectedDesignation);

              var customerData = DBHelper.instance.insertCustomerDetails(customer);
              if (customerData != null) {
                print(customer.firstName);
                print(customer.lastName);
                print(customer.gender);
                print(customer.mobileNumber);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()));
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
              "REGISTER",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Future selectDate(DateTime selectedDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate as DateTime;
        var date = DateTime.parse(selectedDate.toString());
        var formateDate = "${date.day} - ${date.month} - ${date.year}";
        dateOfBirthController.text = formateDate;
      });
    }
  }
}
