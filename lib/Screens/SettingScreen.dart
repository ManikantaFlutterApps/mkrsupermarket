import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mkrsupermarket/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            profileCard(),

            const SizedBox(height: 10,),

            apperanceCard(),

            const SizedBox(height: 10,),

            privacyCard(),

            const SizedBox(height: 10,),

            aboutUS(),

            const SizedBox(height: 10,),

            sendFeedBack(),

            const SizedBox(height: 30,),

            logOutAction()

          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return GestureDetector(
      onTap: (){
        setState(() {

        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.orangeAccent,
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  'lib/images/profile_pic.png',
                  height: 50,
                  width: 50,
                ),
              ),

              const Expanded(
                  flex: 6,
                  child: Text("Manikanta",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),))

            ],
          ),
        ),
      ),
    );
  }

  Widget apperanceCard() {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(children: [

          const SizedBox(width: 5,),

          Expanded(
              flex: 1,
              child: Image.asset('lib/images/setting_icon.jpeg',height: 25,width: 25,)),

          const SizedBox(width: 20,),

          const Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text("Apperance",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                  SizedBox(height: 10,),

                  Text("Make Your Profile Picture",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
                ],
              ),),

          const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_back_ios_new_sharp,)),

          const SizedBox(width: 20,)



        ],),
      ),
    );
  }

  Widget privacyCard() {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(children: [

          const SizedBox(width: 5,),

          Expanded(
              flex: 1,
              child: Image.asset('lib/images/setting_icon.jpeg',height: 25,width: 25,)),

          const SizedBox(width: 20,),

          const Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Privacy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                SizedBox(height: 10,),

                Text("Make Your Privacy Data",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
              ],
            ),),

          const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_back_ios_new_sharp,)),

          const SizedBox(width: 20,)



        ],),
      ),
    );
  }

  Widget aboutUS() {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(children: [

          const SizedBox(width: 5,),

          Expanded(
              flex: 1,
              child: Image.asset('lib/images/setting_icon.jpeg',height: 25,width: 25,)),

          const SizedBox(width: 20,),

          const Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("AboutUS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                SizedBox(height: 10,),

                Text("About Me",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
              ],
            ),),

          const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_back_ios_new_sharp,)),

          const SizedBox(width: 20,)

        ],),
      ),
    );
  }

  Widget sendFeedBack() {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(children: [

          const SizedBox(width: 5,),

          Expanded(
              flex: 1,
              child: Image.asset('lib/images/setting_icon.jpeg',height: 25,width: 25,)),

          const SizedBox(width: 20,),

          const Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("SendFeedBack",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                SizedBox(height: 10,),

                Text("Please Give Feedback Message",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
              ],
            ),),

          const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_back_ios_new_sharp,)),

          const SizedBox(width: 20,)

        ],),
      ),
    );
  }

  Widget logOutAction() {
    return GestureDetector(
      onTap: (){

        setState(() async {
          SharedPreferences mSharedPreference = await SharedPreferences.getInstance();
          mSharedPreference.setString("EMAIL","");
          mSharedPreference.setString("PASSWORD","");
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        });

      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "LOG OUT",
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
}
