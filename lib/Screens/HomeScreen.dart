
import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Models/Category.dart';

import '../Database/DBHelper.dart';
import 'CategoryDetailedScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<Category> categoryList;
  TextEditingController searchController = TextEditingController();


  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    categoryList= await DBHelper.instance.readCategoryDataList();
    print("Category Size ${categoryList.length}");

  }




  /*List<Category> categoryList = [
    Category(categoryID: "1001", categoryName: "FRUITS"),
    Category(categoryID: "1002", categoryName: "VEGETABLES"),
    Category(categoryID: "1003", categoryName: "MILK"),
    Category(categoryID: "1004", categoryName: "MEAT"),
    Category(categoryID: "1005", categoryName: "SNACKS"),
    Category(categoryID: "1006", categoryName: "RICE"),
  ];
*/
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
                    Text(
                      "Sai Balaji Residency ,Nagundahalli Main Road , Bangalore",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "6:00 AM - 11:00 PM",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "What are you Looking for (Mangos , Orange,etc)"),
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
                  color: Colors.white,
                  child: advertismentCard(),
                )),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
                child: categoryLayout(categoryList,context),
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
        itemBuilder: (BuildContext context, int i) => Card(
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
      ));
}

Widget advertismentCard() {
  return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) => Card(
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
      ));
}

Widget categoryLayout(List<Category> categoryList, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10,right: 10),
    child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 3.0,
        children: List.generate(
          categoryList.length,
          (index) {
            return Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailedScreen(category: categoryList[index],),
                      ));

                },
                child: Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(categoryList[index].categoryName,style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),

                ),
              ),
            );
          },
        )),
  );
}
