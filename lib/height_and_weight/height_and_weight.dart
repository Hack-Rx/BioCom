import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:hackathoncalorie/height_and_weight/age_picker.dart';
import 'package:hackathoncalorie/height_and_weight/height_picker.dart';
import 'package:hackathoncalorie/height_and_weight/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathoncalorie/height_and_weight/weight_picker.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/tools/constants.dart';
import 'package:hackathoncalorie/tools/calculator_brain.dart';
import 'package:hackathoncalorie/height_and_weight/results_page.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';

class HeightAndWeight extends StatefulWidget {
  static String id = 'height_and_weight';

  @override
  _HeightAndWeightState createState() => _HeightAndWeightState();
}

class _HeightAndWeightState extends State<HeightAndWeight> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    Navigator.pop(context); // Do some stuff.
    return true;
  }

  int currentIntWeightValue = 30;
  NumberPicker integerNumberWeightPicker;
  int currentIntAgeValue = 10;
  NumberPicker integerNumberAgePicker;
  double currentDoubleHeightValue = 1.0;
  NumberPicker decimalNumberHeightPicker;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFFe3fdfd),
                Color(0xFFcbf1f5),
                Color(0xFFa6e3e9),
                Color(0xFF71c9ce),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Text(
                'My Profile',
                style: TextStyle(
                  color: Color(0xFF12947f),
                  fontSize: 33.0,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  'To ensure accuracy, please input your accurate information.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF27ab30),
                    fontSize: 16.0,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                color: Color(0xFF12947f),
                height: 0.7,
                width: 350.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
                      onPressed: () => showIntAgeDialog(),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("Age",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
                          SizedBox(
                            width: 200.0,
                          ),
                          Text(' $currentIntAgeValue',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
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
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
                          SizedBox(
                            width: 143.0,
                          ),
                          Text('$currentDoubleHeightValue feet',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
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
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
                          SizedBox(
                            width: 142.0,
                          ),
                          Text(' $currentIntWeightValue Kgs',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5)),
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
              ),
              SizedBox(height: 80.0),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(
                        height: currentDoubleHeightValue,
                        weight: currentIntWeightValue);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(70.0),
                        color: Color(0xFF27ab30),
                      ),
                      child: Center(
                        child: Text(
                          'Calculate BMI',
                          style: TextStyle(color: Colors.white, fontSize: 14.5),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      width: 200.0,
                      height: 55.0),
                ),
              ),
            ],
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

  Future showIntAgeDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 10,
          maxValue: 80,
          step: 1,
          initialIntegerValue: currentIntAgeValue,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => currentIntAgeValue = value);
        integerNumberAgePicker.animateInt(value);
      }
    });
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  // Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 20.0, color: Color(0XFFe0e0e0)),
      onPressed: onPressed,
      // onLongPress: onLongPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
