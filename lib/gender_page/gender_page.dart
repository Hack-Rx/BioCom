import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathoncalorie/height_and_weight/age_picker.dart';
import 'package:hackathoncalorie/height_and_weight/height_and_weight.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hackathoncalorie/purpose/purpose.dart';

class GenderPage extends StatefulWidget {
  static String id = 'gender_page';

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
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
              'Select Gender',
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
              'Calories and Stride length calculation needs it.',
              style: TextStyle(
                color: Color(0xFF27ab30),
                fontSize: 16.0,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 160.0,
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: HeightAndWeight(),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        splashColor: Color(0xFF6a9bba),
                        child: Container(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/male.jpg'),
                            radius: 53.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 160.0,
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: HeightAndWeight(),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        splashColor: Color(0xFF6a9bba),
                        child: Container(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/female.jpg'),
                            radius: 53.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(85.0, 0.0, 75.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      )),
    );
  }
}
