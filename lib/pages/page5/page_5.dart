import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Page5State();
  }

}

class _Page5State extends State<Page5>{
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(

      ),
    );
  }
}