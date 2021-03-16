import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  final Color color;
  final double bLevel;
  final Offset offsetW;
  final double height1;
  final Offset offsetB;
  final double width1;
  final IconData iconData;
  final double iconSize;

  const Design(
      {Key key,
      this.color,
      this.offsetW,
      this.bLevel,
      this.height1,
      this.width1,
      this.offsetB,
      this.iconData,
      this.iconSize})
      : super(key: key);
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  bool isPressed = false;

  void onPressedUp(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }

  void onPressedDown(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: onPressedUp,
      onPointerDown: onPressedDown,
      child: isPressed
          ? Container(
              height: widget.height1,
              width: widget.width1,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(-3, -3),
                        color: Colors.white.withOpacity(.7)),
                    BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(3, 3),
                        color: Colors.black.withOpacity(.15))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: widget.bLevel,
                                offset: widget.offsetW,
                                color: Colors.white.withOpacity(.7)),
                            BoxShadow(
                                blurRadius: widget.bLevel,
                                offset: widget.offsetB,
                                color: Colors.black.withOpacity(.25))
                          ]),
                      child: Icon(
                        widget.iconData,
                        size: widget.iconSize,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: widget.height1,
              width: widget.width1,
              decoration: BoxDecoration(
                  color: Color(0xFFe6ebf2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(-3, -3),
                        color: Colors.white.withOpacity(.7)),
                    BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(3, 3),
                        color: Colors.black.withOpacity(.15))
                  ]),
              child: Icon(
                widget.iconData,
                color: Colors.black.withOpacity(.5),
                size: 30.0,
              ),
            ),
    );
  }
}
