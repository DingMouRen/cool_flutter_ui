import 'package:flutter/material.dart';
import 'package:flutter_ui/neumorphic/widget/radio.dart';
import 'package:flutter_ui/pages/page4/bean_4.dart';
import 'package:flutter_ui/pages/page4/color_4.dart';

import '../../neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import '../../neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import '../../neumorphic/neumorphic_box_shape.dart';
import '../../neumorphic/widget/button.dart';
import '../../neumorphic/widget/container.dart';

class Ranking4 extends StatefulWidget {
  @override
  State createState() => _Ranking4Sate();
}

class _Ranking4Sate extends State<Ranking4> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_4_bg,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          _getLayoutAppBar(context),
          SizedBox(
            height: 32,
          ),
          Container(
            margin: EdgeInsets.only(left: 28, right: 28),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ranking',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 91, 108, 140),
                    fontSize: 55),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(child: _getList(context)),
        ],
      ),
    );
  }

  _getLayoutAppBar(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 28, right: 35),
      child: Stack(
        children: [
          NeumorphicButton(
              padding: EdgeInsets.all(12.0),
              onPressed: () {
                Navigator.pop(context);
              },
              style: NeumorphicStyle(
                color: color_4_arrow_back_bg,
                intensity: 0.8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: color_4_button_unpressed,
                size: 20,
              )),
          Align(
            alignment: Alignment.centerRight,
            child: Neumorphic(
              style: NeumorphicStyle(
                  depth: 2,
                  intensity: 1,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  border: NeumorphicBorder(
                      width: 1, color: Color.fromARGB(0, 187, 199, 218))),
              child: NeumorphicRadio(
                groupValue: groupValue,
                padding: EdgeInsets.all(12),
                style: NeumorphicRadioStyle(
                  unselectedColor: color_4_button_unpressed_bg,
                  selectedColor: color_4_button_pressed_bg,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                ),
                value: 1,
                child: Icon(
                  Icons.tune_rounded,
                  color: color_4_button_pressed,
                  size: 20,
                ),
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28, right: 28),
      child: ListView.builder(
          itemCount: listData4.length,
          itemBuilder: (context, index) {
            Bean4 movie = listData4[index];
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(depth: 6, intensity: 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movie.cover!,
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.movieName!,
                          style: TextStyle(
                              color: color_4_title,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              movie.score!,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: color_4_score,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text(
                              movie.showTime!,
                              style: TextStyle(
                                color: color_4_subtitle,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          color: color_4_play,
                          boxShape: NeumorphicBoxShape.circle()),
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Color.fromARGB(255, 252, 233, 218),
                            size: 15,
                          )),
                    ),
                  )
                ],
              ),
            );
          }
          ),
    );
  }
}
