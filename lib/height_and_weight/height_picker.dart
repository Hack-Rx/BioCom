import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'height_and_weight.dart';

class HeightPicker extends StatefulWidget {
  @override
  _HeightPickerState createState() => new _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  double currentDoubleHeightValue = 1.0;
  NumberPicker decimalNumberHeightPicker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Color(0xFF3d84a8).withOpacity(0.8),
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3d84a8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 310.0,
          height: 70.0,
          child: MaterialButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () => showDoubleHeightDialog(),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Text("Height",
                    style: TextStyle(color: Colors.white, fontSize: 17.5)),
                SizedBox(
                  width: 135.0,
                ),
                Text('$currentDoubleHeightValue feet',
                    style: TextStyle(color: Colors.white, fontSize: 17.5)),
                SizedBox(width: 4.0),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white70,
                  size: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showDoubleHeightDialog() async {
    await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.decimal(
          minValue: 1,
          maxValue: 7,
          decimalPlaces: 2,
          initialDoubleValue: currentDoubleHeightValue,
          title: new Text("Height in feet and inches"),
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => currentDoubleHeightValue = value);
        decimalNumberHeightPicker.animateDecimalAndInteger(value);
      }
    });
  }
}
