import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mkrsupermarket/Screens/LoginScreen.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Page One',
            body: 'Page One',
            image: buildImage("lib/images/my_intro_image.jpeg"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Page Two',
            body: 'Page Two',
            image: buildImage("lib/images/my_intro_image.jpeg"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Page Three',
            body: 'Page Three',
            image: buildImage("lib/images/my_intro_image.jpeg"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          )
        ],
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));

        },
        skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: getDotsDecorator(),
      ),
    );
  }

  getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }
}

//widget to add the image on screen
Widget buildImage(String imagePath) {
  return Center(
      child: Image.asset(
    imagePath,
    width: 450,
    height: 200,
  ));
}

//method to customize the dots style
DotsDecorator getDotsDecorator() {
  return const DotsDecorator(
    spacing: EdgeInsets.symmetric(horizontal: 2),
    activeColor: Colors.indigo,
    color: Colors.grey,
    activeSize: Size(12, 5),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
