import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page2/button_1/circle_light_painter.dart';
import 'design.dart';
import 'package:flutter_ui/pages/page2/watch_painter.dart';

import 'button_1/neu_calculator_button.dart';
/// color:9FB1C2  159,177,194
class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page2State();
  }
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getLayoutBar(),
      body: Container(
        // color: Color.fromARGB(255, 227 , 237, 247),
        color: Colors.white,
        child: Column(
          children: [
            CustomPaint(
              painter: WatchPainter(MediaQuery.of(context).size.width/ 100 * 37),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10,),
            NeuCalculatorButton(
              text: 'AC',
              onPressed: (){},
            ),
            SizedBox(height: 10,),
            Design(
              height1: 55,
              width1: 55,
              color: Color(0xFFe6ebf2),
              offsetB: Offset(-2, -2),
              offsetW: Offset(2, 2),
              bLevel: 3.0,
              iconData: Icons.wifi,
              iconSize: 30.0,
            ),
          ],

        ),
      ),
    );
  }

  _getLayoutBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 227 , 237, 247),
      elevation: 0,
      automaticallyImplyLeading:false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Clock',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 49, 69, 106),
              fontWeight: FontWeight.bold
            ),
          ),
          Expanded(child: SizedBox()),
          CustomPaint(
            painter: CircleLightPainter(20),
            child:  CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 227 , 237, 247),
                  radius: 20,
                  child: Image.asset('assets/image/setting_2.png',width: 25,height: 25,),
                ),

          )
        ],
      ),
    );
  }
}
