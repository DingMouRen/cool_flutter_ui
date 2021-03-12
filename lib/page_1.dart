import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Page1State();
  }

}

class _Page1State extends State<Page1>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          _getShader(context)
        ],
      )
    );
  }

  _getShader(BuildContext context){
    print('${MediaQuery.of(context).size.width}');
    print('${MediaQuery.of(context).size.height}');
    return ShaderMask(
      shaderCallback: (Rect bounds){
        return SweepGradient(
          center: Alignment(0,-0.3),
            colors: [Colors.deepOrange,Colors.orange[200]]
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcOver,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,
        child: Card(),
      ),
    );
  }

}
