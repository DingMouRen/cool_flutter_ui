import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';

/// 时间
class WatchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WatchWidgetState();
  }
}

class _WatchWidgetState extends State<WatchWidget> {

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 60), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
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
              painter: _WatchDialOuter(radius),
              child: Container(
                width: radius * 2,
                height: radius * 2,
              ),
            )),
        Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: CustomPaint(
              painter: _WatchDialInner(radius/2),
              child: Container(
                width: radius ,
                height: radius ,
              ),
            )),
        Container(
          child: CustomPaint(
            painter: _WatchHands(radius / 3 * 2 ),
            child: Container(
              width: radius /  3 * 2 ,
              height: radius /  3 * 2,
            ),
          ),
        )

      ],

    );
  }
}

///外表盘
class _WatchDialOuter extends CustomPainter {
  //半径
  late double _radius;

  //刻度数量
  double _numScale = 4;

  //表盘画笔
  late Paint _paintDial;

  //表盘刻度画笔
  late Paint _paintScale;

  _WatchDialOuter(double radius) {
    _radius = radius;
    _paintDial = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 227, 237, 247);

    _paintScale = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4
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
      canvas.drawLine(
          Offset(_radius, 0), Offset(_radius - 20, 0), _paintScale);
      canvas.restore();
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///内表盘
class _WatchDialInner extends CustomPainter {
  //半径
  late double _radius;

  //外表盘画笔
  late Paint _paintDial;


  _WatchDialInner(double radius) {
    _radius = radius;
    _paintDial = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 227, 237, 247);

  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    //画布位移到控件中心
    canvas.translate(_radius, _radius);
    //绘制表盘
    canvas.drawCircle(Offset(0, 0), _radius, _paintDial);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


///内表盘指针
class _WatchHands extends CustomPainter {
  //半径
  late double _radius;

  //外表盘画笔
  late Paint _paintDial;

  //时针画笔
  late Paint _paintHourHand;

  //分针画笔
  late Paint _paintMinuteHand;


  _WatchHands(double radius) {
    _radius = radius;
    _paintDial = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.red;
      // ..color = Color.fromARGB(255, 227, 237, 247);

    _paintHourHand = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 132, 132, 132);

    _paintMinuteHand = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 247, 69, 92);


  }

  @override
  void paint(Canvas canvas, Size size) {

    DateTime dateTime = DateTime.now();
    var hour = dateTime.hour;
    var minute = dateTime.minute;
    var second = dateTime.second;


    canvas.save();
    //画布位移到控件中心
    canvas.translate(_radius/2, _radius/2);
    //绘制时针
    canvas.save();
    canvas.rotate(_getHourRotate(hour));
    canvas.drawLine(Offset(-20, 0), Offset(_radius / 4 * 3 - 5 , 0), _paintHourHand);
    canvas.restore();
    //绘制分针
    canvas.save();
    canvas.rotate(_getMinuteRotate(minute));
    canvas.drawLine(Offset(-20, 0), Offset(size.width, 0), _paintMinuteHand);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  ///显示时针需要转的角度
  double _getHourRotate(int hour) {
    double radianPerHour = pi * 2 / 12;
    if(hour >= 12) hour = hour - 12;
    return radianPerHour * (hour - 3);
  }
  ///显示分针需要转的角度
  double _getMinuteRotate(int minute) {
    double radianPerMinute = pi * 2 / 60;
    return radianPerMinute * (minute - 15);
  }
}

