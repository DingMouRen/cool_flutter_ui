import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/config/router_manager.dart';
import 'package:flutter_ui/page/home_page.dart';
import 'package:flutter_ui/page/page1/page_1.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter UI',
        theme: ThemeData(
            primaryColor: Colors.white,
            brightness: Brightness.dark
        ),
        home: HomePage(),
        // home: Page1(),
      ),
    );
  }


}
