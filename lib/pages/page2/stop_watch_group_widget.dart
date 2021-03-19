import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/config/application.dart';
import 'package:flutter_ui/neumorphic/widget/button.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/neumorphic/widget/switch.dart';
import 'package:flutter_ui/pages/page2/event/stop_watch_tevent.dart';
import 'package:flutter_ui/pages/page2/stop_watch_widget.dart';

///切换秒表时显示
class StopWatchGroupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopWatchGroupWidgetState();
  }
}

class _StopWatchGroupWidgetState extends State<StopWatchGroupWidget> {
  bool _isTime = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StopWatchWidget(),
        SizedBox(
          height: 20,
        ),
        _getLayoutActions(context),
        _getLayoutAlarm_1(context),
        _getLayoutAlarm_2(context),
      ],
    );
  }

  _getLayoutAlarm_1(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 10, right: 10),
      style: NeumorphicStyle(
        color: Color.fromARGB(255, 227, 237, 247),
      ),
      child: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 49, 68, 106),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Lap',
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 147, 162, 184),
                  fontWeight: FontWeight.w700),
            ),
            Expanded(child: SizedBox()),
            Text(
              '00:60:00',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color.fromARGB(255, 64, 83, 118)),
            )
          ],
        ),
      ),
    );
  }

  _getLayoutAlarm_2(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 10, right: 10),
      style: NeumorphicStyle(
        color: Color.fromARGB(255, 227, 237, 247),
      ),
      child: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '2',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 49, 68, 106),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Lap',
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 147, 162, 184),
                  fontWeight: FontWeight.w700),
            ),
            Expanded(child: SizedBox()),
            Text(
              '00:60:00',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color.fromARGB(255, 64, 83, 118)),
            )
          ],
        ),
      ),
    );
  }

  _getLayoutActions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeumorphicButton(
            style: NeumorphicStyle(
              color: Color.fromARGB(255, 227, 237, 247),
            ),
            child: Container(
              width: 130,
              alignment: Alignment.center,
              child: Text(
                _isTime?'Stop':'Start',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color.fromARGB(255, 64, 83, 118)),
              ),
            ),
            onPressed: () {
              setState(() {
                _isTime = !_isTime;
                if(_isTime){
                  Application.eventBus.fire(StopWatchEvent(StopWatchState.TIME));
                }else{
                  Application.eventBus.fire(StopWatchEvent(StopWatchState.STOP));
                }

              });
            },
          ),

          NeumorphicButton(
            style: NeumorphicStyle(
              color: Color.fromARGB(255, 227, 237, 247),
            ),
            child: Container(
              width: 130,
              alignment: Alignment.center,
              child: Text(
                'Reset',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color.fromARGB(255, 234, 111, 113)),
              ),
            ),
            onPressed: () {

              setState(() {
                Application.eventBus.fire(StopWatchEvent(StopWatchState.RESET));
              });
            },
          ),
        ],
      ),
    );
  }


}
