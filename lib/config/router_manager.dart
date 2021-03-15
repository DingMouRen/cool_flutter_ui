import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page1/page_1.dart';
import 'package:flutter_ui/pages/page2/page_2.dart';
import 'package:flutter_ui/pages/page3/page_3.dart';
import 'package:flutter_ui/pages/page4/page_4.dart';
import 'package:flutter_ui/pages/page5/page_5.dart';


class RouterManager{

  static List<Widget> _listPages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5()
  ];

   static to(int index,BuildContext context){
     Navigator.push(context, MaterialPageRoute(builder: (context) => _listPages[index]));
   }
}
