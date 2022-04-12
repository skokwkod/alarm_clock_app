import 'package:alarm_clock_app/models/clocks_class.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  CustomNumberPicker({
    Key? key,
    required this.clock,
  }) : super(key: key);

  ClockClass clock;

  ClockClass returnClock() {
    return clock;
  }

  @override
  _CustomNumberPickerState createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Column(
                  children: [
                    const Text("Ustaw Godzinę"),
                    NumberPicker(
                        minValue: 0,
                        maxValue: 24,
                        value: widget.clock.hours,
                        axis: Axis.horizontal,
                        infiniteLoop: true,
                        onChanged: (newValue) {
                          setState(() {
                            widget.clock.hours = newValue;
                            changeClock(
                                widget.clock, newValue, widget.clock.minutes);
                            print(widget.clock.hours);
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Column(
                children: [
                  Text("Ustaw Minuty"),
                  NumberPicker(
                      minValue: 00,
                      maxValue: 60,
                      value: widget.clock.minutes,
                      axis: Axis.horizontal,
                      infiniteLoop: true,
                      onChanged: (newValue) {
                        setState(() {
                          print('change minute');
                          widget.clock.minutes = newValue;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
