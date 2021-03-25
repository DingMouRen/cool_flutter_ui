import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/neumorphic/neumorphic_box_shape.dart';
import 'package:flutter_ui/neumorphic/theme/theme.dart';
import 'package:flutter_ui/neumorphic/widget/button.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/neumorphic/widget/radio.dart';
import 'package:flutter_ui/pages/page4/bean_4.dart';
import 'package:flutter_ui/pages/page4/color_4.dart';
import 'package:flutter_ui/pages/page4/movie_info_4.dart';
import 'package:flutter_ui/pages/page4/ranking_4.dart';
import 'package:flutter_ui/pages/page4/tab_4.dart';

class Page4 extends StatefulWidget {
  @override
  State createState() => _Page4Sate();
}

class _Page4Sate extends State<Page4> with TickerProviderStateMixin {
  TAB _tab = TAB.INFO;
  double _buttonPlaySize = 80.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_4_bg,
      body: AnimatedCrossFade(
        crossFadeState: _tab == TAB.INFO
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 1000),
        firstChild: MovieInfo4(),
        secondChild: Ranking4(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 236, 244, 252),
        //阴影值
        elevation: 51,
        //凹槽外边距
        notchMargin: _tab == TAB.INFO ? 10 : 0,
        shape: _tab == TAB.INFO ? CircularNotchedRectangle() : null,
        child: _getButtons(context),
      ),
      floatingActionButton: _getPlayButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _getPlayButton(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          color: color_4_play,
          depth: 10,
          intensity: 1,
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.circle()),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: _buttonPlaySize,
        height: _buttonPlaySize,
        alignment: Alignment.center,
        child: Icon(
          Icons.play_arrow_rounded,
          color: Color.fromARGB(255, 252, 233, 219),
        ),
      ),
    );
  }

  _getButtons(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              left: _tab == TAB.INFO ? 0 : 30,
              child: Neumorphic(
                style: NeumorphicStyle(
                    depth: 2,
                    intensity: 1,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                    border: _tab != TAB.INFO
                        ? NeumorphicBorder(width: 0)
                        : NeumorphicBorder(
                            width: 1, color: Color.fromARGB(0, 187, 199, 218))),
                child: NeumorphicRadio(
                  groupValue: _tab,
                  padding: EdgeInsets.all(12),
                  style: NeumorphicRadioStyle(
                    unselectedColor: color_4_button_unpressed_bg,
                    selectedColor: color_4_button_pressed_bg,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  ),
                  value: TAB.INFO,
                  child: Image.asset(
                    'assets/image/img_4_tab_1.png',
                    fit: BoxFit.scaleDown,
                    width: 20,
                    height: 20,
                    color: _tab == TAB.INFO
                        ? color_4_button_pressed
                        : color_4_button_unpressed,
                  ),
                  onChanged: (value) {
                    updateTab(value as TAB);
                  },
                ),
              )),
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              left: _tab == TAB.INFO ? 80 : 115,
              child: Neumorphic(
                style: NeumorphicStyle(
                    depth: 2,
                    intensity: 1,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                    border: _tab != TAB.SEARCH
                        ? NeumorphicBorder(width: 0)
                        : NeumorphicBorder(
                            width: 1, color: Color.fromARGB(0, 187, 199, 218))),
                child: NeumorphicRadio(
                  groupValue: _tab,
                  padding: EdgeInsets.all(12),
                  style: NeumorphicRadioStyle(
                    unselectedColor: color_4_button_unpressed_bg,
                    selectedColor: color_4_button_pressed_bg,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  ),
                  value: TAB.SEARCH,
                  child: Image.asset(
                    'assets/image/img_4_tab_2.png',
                    fit: BoxFit.scaleDown,
                    width: 20,
                    height: 20,
                    color: _tab == TAB.SEARCH
                        ? color_4_button_pressed
                        : color_4_button_unpressed,
                  ),
                  onChanged: (value) {
                    updateTab(value as TAB);
                  },
                ),
              )),
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              right: _tab == TAB.INFO ? 80 : 115,
              child: Neumorphic(
                style: NeumorphicStyle(
                    depth: 2,
                    intensity: 1,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                    border: _tab != TAB.MODEL
                        ? NeumorphicBorder(width: 0)
                        : NeumorphicBorder(
                            width: 1, color: Color.fromARGB(0, 187, 199, 218))),
                child: NeumorphicRadio(
                  groupValue: _tab,
                  padding: EdgeInsets.all(12),
                  style: NeumorphicRadioStyle(
                    unselectedColor: color_4_button_unpressed_bg,
                    selectedColor: color_4_button_pressed_bg,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  ),
                  value: TAB.MODEL,
                  child: Image.asset(
                    'assets/image/img_4_tab_3.png',
                    fit: BoxFit.scaleDown,
                    width: 20,
                    height: 20,
                    color: _tab == TAB.MODEL
                        ? color_4_button_pressed
                        : color_4_button_unpressed,
                  ),
                  onChanged: (value) {
                    updateTab(value as TAB);
                  },
                ),
              )),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            right: _tab == TAB.INFO ? 0 : 30,
            child: Neumorphic(
              style: NeumorphicStyle(
                  depth: 2,
                  intensity: 1,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  border: _tab != TAB.PERSONAL
                      ? NeumorphicBorder(width: 0)
                      : NeumorphicBorder(
                          width: 1, color: Color.fromARGB(0, 187, 199, 218))),
              child: NeumorphicRadio(
                groupValue: _tab,
                padding: EdgeInsets.all(12),
                style: NeumorphicRadioStyle(
                  unselectedColor: color_4_button_unpressed_bg,
                  selectedColor: color_4_button_pressed_bg,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                ),
                value: TAB.PERSONAL,
                child: Image.asset(
                  'assets/image/img_4_tab_4.png',
                  fit: BoxFit.scaleDown,
                  width: 20,
                  height: 20,
                  color: _tab == TAB.PERSONAL
                      ? color_4_button_pressed
                      : color_4_button_unpressed,
                ),
                onChanged: (value) {
                  updateTab(value as TAB);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateTab(TAB tab) {
    _tab = tab;
    if (_tab == TAB.INFO) {
      _buttonPlaySize = 60.0;
    } else {
      _buttonPlaySize = 0;
    }
    setState(() {});
  }
}
