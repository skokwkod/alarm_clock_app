import 'package:flutter/material.dart';

class CustomListAlarm extends StatefulWidget {
  CustomListAlarm(this.clock, {Key? key}) : super(key: key);

  var clock;

  @override
  State<CustomListAlarm> createState() => _CustomListAlarmState();
}

class _CustomListAlarmState extends State<CustomListAlarm> {
  bool _enable = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black26,
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.clock.hours.toString() +
                  ":" +
                  widget.clock.minutes.toString(),
              style: TextStyle(fontSize: 30),
            ),
            Row(
              children: [
                Switch(
                    value: _enable,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        _enable = value;
                      });
                    }),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
