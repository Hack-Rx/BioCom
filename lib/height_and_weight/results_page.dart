import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/purpose/purpose.dart';
import 'package:hackathoncalorie/tools/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathoncalorie/height_and_weight/reusable_card.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathoncalorie/tools/goals_page_with_loader.dart';

class ResultsPage extends StatefulWidget {
  static String id = 'results_page';
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 4,
                child: ReusableCard(
                  paddingTop: 20.0,
                  paddingLeft: 15.0,
                  paddingRight: 15.0,
                  paddingBottom: 40.0,
                  colour: Color(0xFF3d84a8).withOpacity(0.4),
                  cardChild: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 45.0,
                      ),
                      Text(widget.resultText.toUpperCase(),
                          style: kResultTextStyle),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        color: Colors.white,
                        height: 0.7,
                        width: 300.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            widget.bmiResult,
                            style: kBMITextStyle,
                          ),
                          SizedBox(width: 3.0),
                          Text('kg/m2', style: kLabelTextStyle),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 75.0, right: 75.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Purpose(),
                        ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(70.0),
                        color: Color(0xFF27ab30),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      width: 140.0,
                      height: 53.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
