import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleLightPainter extends CustomPainter{
  late Paint _paintRadialGradientLeft;
  late Paint _paintRadialGradientRight;

  late Offset _offsetLeft;
  late Offset _offsetRight;
  late double _radius;

  CircleLightPainter(double radius){
    this._radius = radius;
    _offsetLeft = Offset(-_radius/10 * 3, -_radius/10);
    _offsetRight = Offset(_radius/10, _radius/10);

    var circleLeft = Rect.fromCircle(center: _offsetLeft, radius: _radius + _radius/10  );
    var radialGradientLeft = RadialGradient(
      radius: .5,
      colors: [Colors.white,Color.fromARGB(255, 227 , 237, 247),],
    );
    _paintRadialGradientLeft = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = radialGradientLeft.createShader(circleLeft);

    var circleRight = Rect.fromCircle(center: _offsetRight, radius: _radius + _radius/10 );
    var radialGradientRight = RadialGradient(
      radius: .5,
      colors: [Colors.grey,Color.fromARGB(255, 227 , 237, 247),],
    );
    _paintRadialGradientRight = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = radialGradientRight.createShader(circleRight);



  }

  @override
  void paint(Canvas canvas, Size size) {


    canvas.save();
    canvas.translate(_radius, _radius);
    canvas.drawCircle(_offsetLeft, _radius + _radius/10  , _paintRadialGradientLeft);
    canvas.drawCircle(_offsetRight, _radius + _radius/10 , _paintRadialGradientRight);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}