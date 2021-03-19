import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/neumorphic/widget/switch.dart';
import 'package:flutter_ui/pages/page2/watch_widget.dart';
//切换闹钟显示
class AlarmGroupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlarmGroupWidgetState();
  }
}

class _AlarmGroupWidgetState extends State<AlarmGroupWidget> {
  bool _isChecked_1 = true;
  bool _isChecked_2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WatchWidget(),
        SizedBox(
          height: 20,
        ),
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
              '5:00',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 49, 68, 106),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'am',
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 147, 162, 184),
                  fontWeight: FontWeight.w700),
            ),
            Expanded(child: SizedBox()),
            NeumorphicSwitch(
              isEnabled: true,
              value: _isChecked_1,
              onChanged: (value) {
                setState(() {
                  _isChecked_1 = value;
                });
              },
              style: NeumorphicSwitchStyle(
                  activeTrackColor: Color.fromARGB(255, 185, 206, 226),
                  activeThumbColor: Color.fromARGB(255, 49, 69, 106),
                  inactiveTrackColor: Color.fromARGB(255, 222, 232, 242),
                  inactiveThumbColor: Color.fromARGB(255, 227, 237, 247)),
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
              '6:00',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 49, 68, 106),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'am',
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 147, 162, 184),
                  fontWeight: FontWeight.w700),
            ),
            Expanded(child: SizedBox()),
            NeumorphicSwitch(
              isEnabled: true,
              value: _isChecked_2,
              onChanged: (value) {
                setState(() {
                  _isChecked_2 = value;
                });
              },
              style: NeumorphicSwitchStyle(
                  activeTrackColor: Color.fromARGB(255, 185, 206, 226),
                  activeThumbColor: Color.fromARGB(255, 49, 69, 106),
                  inactiveTrackColor: Color.fromARGB(255, 222, 232, 242),
                  inactiveThumbColor: Color.fromARGB(255, 227, 237, 247)),
            )
          ],
        ),
      ),
    );
  }
}
