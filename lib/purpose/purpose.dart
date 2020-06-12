import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/goal_page/goal_page.dart';
import 'package:hackathoncalorie/height_and_weight/height_and_weight.dart';
import 'package:page_transition/page_transition.dart';

class Purpose extends StatefulWidget {
  static String id = 'purpose';

  @override
  _PurposeState createState() => _PurposeState();
}

class _PurposeState extends State<Purpose> {
  int selectedPurpose = 0;
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
              height: 45.0,
            ),
            Text(
              'Purpose',
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
            Text(
              'To help you with your concerns regarding your body, we need this information.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF27ab30),
                fontSize: 16.0,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                splashColor: Color(0xFF27ab30),
                padding: EdgeInsets.all(0.0),
                child: Container(
                    height: 80.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF3d84a8).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                      child: Text('Gain Weight',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: GoalPage(),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                splashColor: Color(0xFF27ab30),
                padding: EdgeInsets.all(0.0),
                child: Container(
                    height: 80.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF3d84a8).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                      child: Text('Maintain your Weight',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: GoalPage(),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                splashColor: Color(0xFF27ab30),
                padding: EdgeInsets.all(0.0),
                child: Container(
                    height: 80.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF3d84a8).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                      child: Text('Lose Weight',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: GoalPage(),
                      ));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
