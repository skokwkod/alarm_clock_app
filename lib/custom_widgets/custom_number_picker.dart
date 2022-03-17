import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  CustomNumberPicker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.minValue,
      required this.text})
      : super(key: key);

  int value;
  int maxValue;
  int minValue;
  String text;

  @override
  _CustomNumberPickerState createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Text(widget.text),
          NumberPicker(
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            value: widget.value,
            onChanged: (newValue) => setState(() => widget.value = newValue),
            axis: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
