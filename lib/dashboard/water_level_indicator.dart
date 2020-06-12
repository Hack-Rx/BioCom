import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class WaterLevelIndicator extends StatefulWidget {
  WaterLevelIndicator({this.currentStep});

  int currentStep;
  @override
  _WaterLevelIndicatorState createState() => _WaterLevelIndicatorState();
}

class _WaterLevelIndicatorState extends State<WaterLevelIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: 12,
      selectedStepSize: 10.0,
      unselectedStepSize: 6.0,
      currentStep: widget.currentStep,
      padding: math.pi / 20,
      width: 100,
    );
  }
}
