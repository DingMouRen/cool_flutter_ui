import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/page4/bean_4.dart';
import 'package:flutter_ui/pages/page4/color_4.dart';

import '../../neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import '../../neumorphic/decoration/neumorphic_emboss_decoration_painter.dart';
import '../../neumorphic/neumorphic_box_shape.dart';
import '../../neumorphic/widget/button.dart';
import '../../neumorphic/widget/container.dart';

class MovieInfo4 extends StatefulWidget {
  @override
  State createState() => _MovieInfo4Sate();
}

class _MovieInfo4Sate extends State<MovieInfo4> {
  Bean4 movie = Bean4('It:Chapter Two',"Drama,Fantasy,Horror",'2019','6.3','2h 49m','38 060','assets/image/page_4_1.jpg');

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
            height: 40,
          ),
          _getMovieInfo(context),
        ],
      ),
    );
  }

  _getLayoutAppBar(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 28),
      child: NeumorphicButton(
          padding: EdgeInsets.all(12.0),
          onPressed: () {
            Navigator.pop(context);
          },
          style: NeumorphicStyle(
            color: color_4_arrow_back_bg,
            intensity: 0.8,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            color: color_4_button_unpressed,
            size: 20,
          )),
    );
  }

  _getMovieInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              depth: 20,
              intensity: 1,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            ),
            child: Image.asset(
              movie.cover!,
              fit: BoxFit.cover,
              width: 320,
              height: 440,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            movie.movieName!,
            style: TextStyle(
              color: color_4_title,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            movie.actor!,
            style: TextStyle(
              color: color_4_subtitle,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movie.showTime!,
                style: TextStyle(
                  color: color_4_subtitle,
                  fontSize: 12,
                ),
              ),
              Column(
                children: [
                  Text(
                    movie.score!,
                    style: TextStyle(
                      color: color_4_score,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    movie.viewCounts!,
                    style: TextStyle(
                      color: color_4_subtitle,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                movie.duration!,
                style: TextStyle(
                  color: color_4_subtitle,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
