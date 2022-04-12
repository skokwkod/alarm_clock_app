import 'package:alarm_clock_app/models/clocks_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_number_picker.dart';

class CustomListAlarm extends StatefulWidget {
  CustomListAlarm(this.clock, this.index, {Key? key}) : super(key: key);
  int index;
  ClockClass clock;

  @override
  State<CustomListAlarm> createState() => _CustomListAlarmState();
}

class _CustomListAlarmState extends State<CustomListAlarm> {
  bool _enable = true;
  DateTime alarmHours = DateTime.now();

  void _SetDateTime() {
    final formatter = DateFormat.HOUR24_MINUTE;
    final String formatted;

    alarmHours =
        DateTime(2022, 3, 21, widget.clock.hours, widget.clock.minutes);
  }

  @override
  void initState() {
    _SetDateTime();
  }

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
              DateFormat("HH:mm").format(alarmHours).toString(),
              style: TextStyle(fontSize: 30),
            ),
            Row(
              children: [
                Switch(
                    value: _enable,
                    onChanged: (value) {
                      setState(() {
                        _enable = value;
                      });
                    }),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomNumberPicker(
                                            clock: widget.clock),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                      child: Text('Zapisz'),
                                      onPressed: () {
                                        setState(() {
                                          CustomNumberPicker(
                                                  clock: widget.clock)
                                              .returnClock();
                                        });
                                        print(CustomNumberPicker(
                                                clock: widget.clock)
                                            .returnClock()
                                            .minutes);
                                        Navigator.of(context).pop();
                                      })
                                ],
                              ),
                            );
                          });
                      // Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
