import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightPicker extends StatefulWidget {
  @override
  _WeightPickerState createState() => new _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  int currentIntWeightValue = 30;
  NumberPicker integerNumberWeightPicker;

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
            onPressed: () => showIntWeightDialog(),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Text("Weight",
                    style: TextStyle(color: Colors.white, fontSize: 17.5)),
                SizedBox(
                  width: 142.0,
                ),
                Text(' $currentIntWeightValue Kgs',
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

  Future showIntWeightDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 30,
          maxValue: 150,
          step: 1,
          initialIntegerValue: currentIntWeightValue,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => currentIntWeightValue = value);
        integerNumberWeightPicker.animateInt(value);
      }
    });
  }
}
