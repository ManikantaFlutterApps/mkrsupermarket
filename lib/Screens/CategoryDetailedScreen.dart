import 'package:flutter/material.dart';

import '../Models/Category.dart';

class CategoryDetailedScreen extends StatefulWidget {

   final Category category;

  CategoryDetailedScreen({
    required this.category
});


  @override
  State<CategoryDetailedScreen> createState() => _CategoryDetailedScreenState();
}

class _CategoryDetailedScreenState extends State<CategoryDetailedScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title:Text(widget.category.categoryName,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),) ,),
      body: Container(),
    );
  }
}
