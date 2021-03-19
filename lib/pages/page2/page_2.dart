import 'package:flutter/material.dart';
import 'package:flutter_ui/neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import 'package:flutter_ui/neumorphic/neumorphic_box_shape.dart';
import 'package:flutter_ui/neumorphic/widget/app_bar.dart';
import 'package:flutter_ui/neumorphic/widget/button.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/neumorphic/widget/switch.dart';
import 'package:flutter_ui/pages/page2/alarm_group_widget.dart';
import 'package:flutter_ui/pages/page2/bottom_bar_widget.dart';
import 'package:flutter_ui/pages/page2/stop_watch_group_widget.dart';
import 'package:flutter_ui/pages/page2/watch_widget.dart';
import 'package:oktoast/oktoast.dart';

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page2State();
  }
}

class _Page2State extends State<Page2> {

  late Watch watch = Watch.ALARM;

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
            _getClockWIdget(),
            Expanded(child: SizedBox(),),
            _getBottomBar(context)

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


  _getBottomBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16,bottom: 30),
      child: BottomBarWidget(watch: watch, onChanged: (watch){
        setState(() {
          this.watch = watch;
        });
      }),
    );
  }

  _getClockWIdget() {
    if(watch == Watch.TIME || watch == Watch.ALARM) return AlarmGroupWidget();
    return StopWatchGroupWidget();
  }
}
