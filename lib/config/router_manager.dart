import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page1/page_1.dart';


class RouterManager{
  static const String page1 = 'page1';

  static List<Widget> _listPages = [
    Page1(),
  ];

   static to(int index,BuildContext context){
     Navigator.push(context, MaterialPageRoute(builder: (context) => _listPages[index]));
   }
}
