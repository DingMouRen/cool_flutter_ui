import 'dart:async';
import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/application.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/pages/page2/event/stop_watch_tevent.dart';

enum StopWatchState{TIME,STOP,RESET}

/// 秒表
class StopWatchWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _StopWatchWidgetState();
  }
}

class _StopWatchWidgetState extends State<StopWatchWidget> {

  Timer? _timer ;
  String _time = '00:00:00';
  int _timeMilliseconds = 0;

  @override
  void initState() {
    super.initState();


    Application.eventBus.on<StopWatchEvent>().listen((event) {
      print('${event.stopWatchState.toString()}');
      if(event.stopWatchState == StopWatchState.TIME){
        _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
          setState(() {
            _timeMilliseconds+=10;
            var duration = Duration(milliseconds: _timeMilliseconds);
            String durationStr = duration.toString();
            _time = durationStr.substring(0,durationStr.length - 4);
          });
        });
      }else if(event.stopWatchState == StopWatchState.STOP){
        _timer!.cancel();
      }else if(event.stopWatchState == StopWatchState.RESET){
        _timeMilliseconds = 0;
        _time = '00:00:00';
        _timer!.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double radius = screenWidth / 100 * 37;
    return Stack(
      alignment: Alignment.center,
      children: [
        Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: CustomPaint(
              painter: _StopWatchDial(radius),
              child: Container(
                width: radius * 2,
                height: radius * 2,
              ),
            )),
         Text(_time,
         style: TextStyle(
           fontSize: 28,
           color: Color.fromARGB(255, 49, 69, 106),
           fontWeight: FontWeight.w800
         ),
         )
        

      ],

    );
  }
}

///秒表盘
class _StopWatchDial extends CustomPainter {
  //半径
  late double _radius;

  //刻度数量
  double _numScale = 60 * 3;

  //表盘画笔
  late Paint _paintDial;

  //表盘刻度画笔
  late Paint _paintScale;


  _StopWatchDial(double radius) {
    _radius = radius;
    _paintDial = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 227, 237, 247);

    _paintScale = Paint()
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 184, 198, 211);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    //画布位移到控件中心
    canvas.translate(_radius, _radius);
    //绘制外表盘
    canvas.drawCircle(Offset(0, 0), _radius, _paintDial);
    //绘制外表盘的刻度
    for (double i = 0; i < _numScale; i++) {
      canvas.save();
      double deg = 360 / _numScale * i;
      canvas.rotate(deg / 180 * pi);
      canvas.drawLine(Offset(_radius - 8, 0), Offset(_radius - 15, 0), _paintScale);
      canvas.restore();
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
