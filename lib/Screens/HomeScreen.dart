import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sai Balaji Residency ,Nagundahalli Main Road , Bangalore",style: TextStyle(fontSize: 10,color: Colors.blueAccent,fontWeight: FontWeight.normal),),

                    SizedBox(height: 5,),

                    Text("6:00 AM - 11:00 PM",style: TextStyle(fontSize: 8,color: Colors.redAccent,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child:  Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(left: 10,right: 10),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What are you Looking for (Mangos , Orange,etc)"
                      ),

                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: productsCard(),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blueAccent,
              ),
            ),

            Expanded(
              flex: 7,
              child: Container(
                color: Colors.pinkAccent,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

Widget productsCard() {
  return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) =>
            Card(
              child: SizedBox(
                width: 160.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('lib/images/g_image_one.png'),
                  ],
                ),
              ),
            ),
      )
  );
}