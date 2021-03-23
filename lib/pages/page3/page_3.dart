import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page3/event/mp3_index_event.dart';
import 'package:flutter_ui/pages/page3/play_page_3.dart';
import 'package:flutter_ui/pages/page3/song_3.dart';
import 'package:flutter_ui/pages/page3/song_data.dart';

import '../../config/application.dart';
import '../../neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import '../../neumorphic/neumorphic_box_shape.dart';
import '../../neumorphic/widget/button.dart';
import '../../neumorphic/widget/container.dart';

class Page3 extends StatefulWidget {
  @override
  State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin{
  Song3? _currentSong;
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

    Application.eventBus.on<Mp3IndexEvent>().listen((event) {
      _currentSong = songData3[event.index];
      if(_currentSong!.state == PlayingState.PLAYING){
        _controller!.forward();
      }else{
        _controller!.stop();
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: _getBody(context),
      ),
    );
  }

  _getBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          _getTitle(context),
          SizedBox(
            height: 60,
          ),
          _getLayoutAction(context),
          SizedBox(
            height: 40,
          ),
          _getList(context),
        ],
      ),
    );
  }

  _getTitle(BuildContext context) {
    return Text(
      _currentSong == null ? 'SKIN · FLUME' : _currentSong!.name!,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color.fromARGB(255, 180, 194, 217)),
    );
  }

  _getLayoutAction(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeumorphicButton(
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
                Icons.favorite,
                color: Color.fromARGB(255, 162, 177, 202),
                size: 15,
              ),
            ),
          ),
          Hero(
            tag: "music_cover",
            child: Neumorphic(
              style: NeumorphicStyle(
                  border: NeumorphicBorder(
                      width: 4, color: Color.fromARGB(255, 207, 218, 235)),
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  color: Color.fromARGB(255, 222, 231, 246),
                  depth: 6,
                  intensity: 1),
              child: AnimatedBuilder(
                child: Image.asset(
                  _currentSong == null?'assets/image/mp3_3_3.jpg':_currentSong!.cover!,
                  width: 150,
                  height: 150,
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
          NeumorphicButton(
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
                Icons.more_horiz,
                color: Color.fromARGB(255, 162, 177, 202),
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: songData3.length,
          itemBuilder: (context, index) {
            return _getItem(songData3[index]);
          }),
    );
  }

  _getItem(Song3 song) {
    return InkWell(
      onTap: () {
        songData3.forEach((element) {
          element.state = PlayingState.RESET;
        });
        song.state = PlayingState.PLAYING;
        _currentSong = song;
        _controller!.forward();
        setState(() {});
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayPage3(song,'music_cover')));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: song.state == PlayingState.PLAYING
              ? Color.fromARGB(255, 209, 222, 243)
              : Colors.transparent,
        ),
        height: 80,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    song.name!,
                    style: TextStyle(
                        color: Color.fromARGB(255, 125, 140, 164),
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    song.singer!,
                    style: TextStyle(
                        color: Color.fromARGB(255, 193, 203, 220),
                        fontSize: 12),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: NeumorphicButton(
                onPressed: () {
                  song.state = PlayingState.STOP;
                  _currentSong = null;
                  _controller!.stop();
                  setState(() {});
                },
                style: NeumorphicStyle(
                    border: NeumorphicBorder(
                        width: 3,
                        color: song.state == PlayingState.PLAYING
                            ? Color.fromARGB(120, 111, 136, 255)
                            : Color.fromARGB(120, 213, 224, 241)),
                    shape: song.state == PlayingState.PLAYING
                        ? NeumorphicShape.concave
                        : NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                    color: song.state == PlayingState.PLAYING
                        ? Color.fromARGB(255, 126, 156, 255)
                        : Color.fromARGB(255, 235, 244, 255),
                    depth: 6,
                    intensity: 1),
                child: Container(
                  width: 16,
                  height: 16,
                  child: Icon(
                    song.state == PlayingState.PLAYING
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: song.state == PlayingState.PLAYING
                        ? Colors.white
                        : Color.fromARGB(255, 162, 177, 202),
                    size: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
