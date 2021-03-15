import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page1/page_1.dart';
import 'package:flutter_ui/pages/page2/page2.dart';


class RouterManager{

  static List<Widget> _listPages = [
    Page1(),
    Page2(),
  ];

   static to(int index,BuildContext context){
     Navigator.push(context, MaterialPageRoute(builder: (context) => _listPages[index]));
   }
}
