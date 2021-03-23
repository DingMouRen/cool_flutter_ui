import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page3/event/mp3_index_event.dart';
import 'package:flutter_ui/pages/page3/song_3.dart';
import 'package:flutter_ui/pages/page3/song_data.dart';

import '../../config/application.dart';
import '../../neumorphic/neumorphic_box_shape.dart';
import '../../neumorphic/theme/theme.dart';
import '../../neumorphic/widget/button.dart';
import '../../neumorphic/widget/container.dart';
import '../../neumorphic/widget/container.dart';
import '../../neumorphic/widget/slider.dart';

class PlayPage3 extends StatefulWidget {
  Song3? song;
  String? heroTag;

  PlayPage3(this.song,this.heroTag);

  @override
  State<StatefulWidget> createState() {
    return _PlayPage3State();
  }
}

class _PlayPage3State extends State<PlayPage3> with SingleTickerProviderStateMixin{
  double _percent = 2;
  AnimationController? _controller ;
  Animation? _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration:Duration(seconds: 6),vsync: this)
      ..addStatusListener((status) {
        switch(status){
          case AnimationStatus.completed:
            _controller!.repeat();
            break;
          default:
            break;
        }
      });
    _animation = Tween(begin: 0.0,end: 2.0 * pi).animate(_controller!);
    _controller!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                Color.fromARGB(255, 224, 234, 253),
                Color.fromARGB(255, 255, 255, 255)
              ]),
        ),
        child: _getBody(context, screenWidth),
      ),
    );
  }

  _getBody(BuildContext context, double screenWidth) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        _getLayoutBar(context),
        SizedBox(
          height: 40,
        ),
        _getSongInfo(context, screenWidth),
        SizedBox(
          height: 40,
        ),
        _getBottomActions(context),
      ],
    );
  }

  /// titleBar布局
  _getLayoutBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: NeumorphicButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: NeumorphicStyle(
                  border: NeumorphicBorder(
                      width: 3, color: Color.fromARGB(120, 213, 224, 241)),
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  color: Color.fromARGB(255, 222, 231, 246),
                  depth: 6,
                  intensity: 1),
              child: Container(
                width: 20,
                height: 20,
                color: Colors.transparent,
                child: Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Color.fromARGB(255, 162, 177, 202),
                  size: 18,
                ),
              ),
            ),
          ),
          Text(
            'PLAYING NOW',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(255, 180, 194, 217)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: NeumorphicButton(
              onPressed: () {},
              style: NeumorphicStyle(
                  border: NeumorphicBorder(
                      width: 3, color: Color.fromARGB(120, 213, 224, 241)),
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  color: Color.fromARGB(255, 222, 231, 246),
                  depth: 6,
                  intensity: 1),
              child: Container(
                width: 20,
                height: 20,
                color: Colors.transparent,
                child: Icon(
                  Icons.dehaze_rounded,
                  color: Color.fromARGB(255, 162, 177, 202),
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///歌曲信息
  _getSongInfo(BuildContext context, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: widget.heroTag!,
            child: Neumorphic(
              style: NeumorphicStyle(
                  border: NeumorphicBorder(
                      width: 8, color: Color.fromARGB(255, 207, 218, 235)),
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  color: Color.fromARGB(255, 222, 231, 246),
                  depth: 20,
                  intensity: 1),
              child: AnimatedBuilder(
                child: Image.asset(
                  widget.song!.cover!,
                  width: screenWidth / 100 * 74,
                  height: screenWidth / 100 * 74,
                  fit: BoxFit.cover,
                ),
                animation: _animation!,
                builder: (context,child){
                  return Transform(
                    alignment: Alignment.center,
                    // transform: Matrix4.rotationZ(_animation_1.value),
                    transform: Matrix4.rotationZ(_animation!.value),
                    child: child,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            widget.song!.name!,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 125, 140, 164),
                fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.song!.singer!,
            style: TextStyle(
                color: Color.fromARGB(255, 193, 203, 220), fontSize: 14),
          ),
          SizedBox(
            height: 40,
          ),
          _getMusicPercent(context),
          _getSlider(context),
        ],
      ),
    );
  }

  ///获取slider
  _getSlider(BuildContext context) {
    return NeumorphicSlider(
        min: 0,
        max: 100,
        value: _percent,
        height: 6,
        onChanged: (percent) {
          _percent = percent;
          setState(() {});
        },
        style: SliderStyle(
          accent: Color.fromARGB(255, 140, 171, 255),
          variant: Color.fromARGB(255, 140, 171, 255),
        ),
        thumb: Neumorphic(
          style: NeumorphicStyle(
            intensity: 1,
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Container(
            width: 26,
            height: 26,
            color: Color.fromARGB(255, 235, 246, 255),
            alignment: Alignment.center,
            child: Container(
              width: 8,
              height: 8,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 140, 171, 255),
              ),
            ),
          ),
        ));
  }

  _getMusicPercent(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '0:02',
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(255, 172, 185, 206)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '3:46',
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(255, 172, 185, 206)),
            ),
          ),
        ],
      ),
    );
  }

  ///暂停，前一首，后一首
  _getBottomActions(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicButton(
            onPressed: () {
              int index = songData3.indexOf(widget.song!);
              if(index > 0){
                index = index - 1;
                widget.song = songData3[index];
                songData3.forEach((element) {
                  element.state = PlayingState.RESET;
                });
                widget.song!.state = PlayingState.PLAYING;
                Application.eventBus.fire(Mp3IndexEvent(index));
              }

              setState(() {

              });
            },
            style: NeumorphicStyle(
                border: NeumorphicBorder(
                    width: 3, color: Color.fromARGB(80, 213, 224, 241)),
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                color: Color.fromARGB(120, 232, 242, 255),
                depth: 6,
                intensity: 1),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(
                Icons.fast_rewind_rounded,
                color: Color.fromARGB(255, 162, 177, 202),
                size: 30,
              ),
            ),
          ),
          NeumorphicButton(
            onPressed: () {
              if (widget.song!.state == PlayingState.PLAYING) {
                widget.song!.state = PlayingState.STOP;
                _controller!.stop();
              } else {
                widget.song!.state = PlayingState.PLAYING;
                _controller!.forward();
              }

              int index = songData3.indexOf(widget.song!);
              Application.eventBus.fire(Mp3IndexEvent(index));

              setState(() {

              });
            },
            style: NeumorphicStyle(
                border: NeumorphicBorder(
                    width: 3, color: Color.fromARGB(80, 213, 224, 241)),
                shape: widget.song!.state == PlayingState.PLAYING
                    ? NeumorphicShape.concave
                    : NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                color: widget.song!.state == PlayingState.PLAYING
                    ? Color.fromARGB(255, 126, 156, 255)
                    : Color.fromARGB(255, 235, 244, 255),
                depth: 6,
                intensity: 1),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(
                widget.song!.state == PlayingState.PLAYING
                    ? Icons.pause
                    : Icons.play_arrow,
                color: widget.song!.state == PlayingState.PLAYING
                    ? Colors.white
                    : Color.fromARGB(255, 162, 177, 202),
                size: 30,
              ),
            ),
          ),
          NeumorphicButton(
            onPressed: () {
              int index = songData3.indexOf(widget.song!);
              if(index < songData3.length){
                widget.song = songData3[index + 1];
                songData3.forEach((element) {
                  element.state = PlayingState.RESET;
                });
                widget.song!.state = PlayingState.PLAYING;
                Application.eventBus.fire(Mp3IndexEvent(index + 1));
              }
              setState(() {

              });
            },
            style: NeumorphicStyle(
                border: NeumorphicBorder(
                    width: 3, color: Color.fromARGB(80, 213, 224, 241)),
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                color: Color.fromARGB(120, 232, 242, 255),
                depth: 6,
                intensity: 1),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(
                Icons.fast_forward_rounded,
                color: Color.fromARGB(255, 162, 177, 202),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
