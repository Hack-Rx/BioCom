import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/tools/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathoncalorie/height_and_weight/reusable_card.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GoalsPageWithLoader extends StatefulWidget {
  static String id = 'goals_page_with_loader';
  int counter = 1;

  @override
  _GoalsPageWithLoaderState createState() => _GoalsPageWithLoaderState();
}

class _GoalsPageWithLoaderState extends State<GoalsPageWithLoader> {
  int selectedPurpose = 0;
  int currentIntGoalWeightValue = 75;
  NumberPicker integerNumberGoalWeightPicker;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: Dashboard()));
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitFoldingCube(
                color: Colors.white,
                size: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showIntGoalWeightDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.integer(
          minValue: 30,
          maxValue: 150,
          step: 1,
          initialIntegerValue: currentIntGoalWeightValue,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => currentIntGoalWeightValue = value);
        integerNumberGoalWeightPicker.animateInt(value);
      }
    });
  }
}
