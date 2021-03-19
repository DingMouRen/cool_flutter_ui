import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/neumorphic/widget/container.dart';
import 'package:flutter_ui/neumorphic/widget/radio.dart';

enum Watch { TIME, ALARM, STOP_WATCH, TIMER }

class BottomBarWidget extends StatelessWidget {
  final Watch watch;
  final ValueChanged<Watch> onChanged;

  const BottomBarWidget({required this.watch, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeumorphicRadio(
          groupValue: this.watch,
          padding: EdgeInsets.all(20),
          style: NeumorphicRadioStyle(
            unselectedColor: Color.fromARGB(255, 227, 237, 247),
            selectedColor: Color.fromARGB(255, 229, 238, 248),
          ),
          value: Watch.TIME,
          child: Image.asset(
            'assets/image/time_2.png',
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
          onChanged: (value) => this.onChanged(value as Watch),
        ),
        NeumorphicRadio(
          groupValue: this.watch,
          padding: EdgeInsets.all(20),
          style: NeumorphicRadioStyle(
            unselectedColor: Color.fromARGB(255, 227, 237, 247),
            selectedColor: Color.fromARGB(255, 229, 238, 248),
          ),
          value: Watch.ALARM,
          child: Image.asset(
            'assets/image/alarm_2.png',
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
          onChanged: (value) => this.onChanged(value as Watch),
        ),
        NeumorphicRadio(
          groupValue: this.watch,
          padding: EdgeInsets.all(20),
          style: NeumorphicRadioStyle(
            unselectedColor: Color.fromARGB(255, 227, 237, 247),
            selectedColor: Color.fromARGB(255, 229, 238, 248),
          ),
          value: Watch.STOP_WATCH,
          child: Image.asset(
            'assets/image/stop_watch_2.png',
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
          onChanged: (value) => this.onChanged(value as Watch),
        ),
        NeumorphicRadio(
          groupValue: this.watch,
          padding: EdgeInsets.all(20),
          style: NeumorphicRadioStyle(
            unselectedColor: Color.fromARGB(255, 227, 237, 247),
            selectedColor: Color.fromARGB(255, 229, 238, 248),
          ),
          value: Watch.TIMER,
          child: Image.asset(
            'assets/image/timer_2.png',
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
          onChanged: (value) => this.onChanged(value as Watch),
        ),
      ],
    );
  }
}
