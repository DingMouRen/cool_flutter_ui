import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'nm_box.dart';

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      // backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NMButton(icon: Icons.arrow_back),
                    NMButton(icon: Icons.menu),
                  ],
                ),
                AvatarImage(),
                SizedBox(height: 15),
                Text(
                  'Steven Dz',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Amsterdam',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 15),
                Text(
                  'Mobile App Developer and Game Designer',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NMButton(icon: FontAwesomeIcons.facebookF),
                    SizedBox(width: 25),
                    NMButton(icon: FontAwesomeIcons.twitter),
                    SizedBox(width: 25),
                    NMButton(icon: FontAwesomeIcons.instagram),
                  ],
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.dribbble,
                        count: '35',
                        category: 'shots'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.userAlt,
                        count: '1.2k',
                        category: 'followers'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.heart,
                        count: '5.1k',
                        category: 'likes'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.user,
                        count: '485',
                        category: 'following'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.glassWhiskey,
                        count: '97',
                        category: 'buckets'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.folderOpen,
                        count: '7',
                        category: 'projects'),
                  ],
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.07,
            minChildSize: 0.07,
            maxChildSize: 0.4,
            builder: (BuildContext context, scroll) {
              return Container(
                decoration: nMbox,
                child: ListView(
                  controller: scroll,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.share, color: fCL),
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Credits to Planet X on Dribbble\nfor this design',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 35),
                          Container(
                            width: 225,
                            padding: EdgeInsets.all(10),
                            decoration: nMboxInvert,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.facebookF, color: fCL),
                                Icon(FontAwesomeIcons.twitter, color: fCL),
                                Icon(FontAwesomeIcons.instagram, color: fCL),
                                Icon(FontAwesomeIcons.whatsapp, color: fCL),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          FaIcon(
                            FontAwesomeIcons.copy,
                            color: Colors.pink.shade800,
                          ),
                          Text(
                            'Copy link',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  final IconData icon;
  final String count;
  final String category;

  const SocialBox({this.icon, this.count, this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: nMboxInvert,
        child: Row(
          children: <Widget>[
            FaIcon(icon, color: Colors.pink.shade800, size: 20),
            SizedBox(width: 8),
            Text(
              count,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 3),
            Text(
              category,
            ),
          ],
        ),
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final IconData icon;
  const NMButton({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: nMbox,
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: nMbox,
      child: Container(
        decoration: nMbox,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/image/avatar.JPG'),
            ),
          ),
        ),
      ),
    );
  }
}
