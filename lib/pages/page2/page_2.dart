import 'package:flutter/material.dart';
import 'package:flutter_ui/neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import 'package:flutter_ui/neumorphic/neumorphic_box_shape.dart';
import 'package:flutter_ui/neumorphic/widget/app_bar.dart';
import 'package:flutter_ui/neumorphic/widget/button.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:oktoast/oktoast.dart';

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
      body: Container(
        color: Color.fromARGB(255, 227, 237, 247),
        child: Column(
          children: [
            _LayoutBar(context),
            SizedBox(
              height: 20,
            ),
            _LayoutDialPlate(context),
          ],
        ),
      ),
    );
  }

  /// titleBar布局
  _LayoutBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 227, 237, 247),
      elevation: 0,
      title: Text(
        'Clock',
        style: TextStyle(
          color: Color.fromARGB(255, 49, 68, 106),
          fontWeight: FontWeight.w700,
          fontSize: 28,
          shadows: [
            Shadow(
                color: Colors.black38, offset: Offset(1.0, 1.0), blurRadius: 2)
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        NeumorphicButton(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 16),
          onPressed: () {},
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
            color: Color.fromARGB(255, 227, 237, 247),
          ),
          child: Image.asset(
            'assets/image/setting_2.png',
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }

  _LayoutDialPlate(BuildContext context) {
    return Neumorphic();
  }
}
