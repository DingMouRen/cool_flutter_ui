import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/page/page1/page_1.dart';


class RouterManager{
  static const String page1 = 'page1';
   static to(String pageName,BuildContext context){
      switch(pageName){
        case page1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
          break;
      }
   }
}
