import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackathoncalorie/calorie_tracker/calorie_tracker.dart';
import 'package:hackathoncalorie/dashboard/line_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_consumed.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_steps.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_burnt.dart';
import 'package:hackathoncalorie/dashboard/water_level_indicator.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:hackathoncalorie/fit_at_home/fit_at_home.dart';
import 'package:hackathoncalorie/login_screen/login_screen.dart';
import 'package:hackathoncalorie/meal_planner/meal_planner.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/splash_screen/splash_screen.dart';
import 'package:hackathoncalorie/workouts/workouts_intro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/foundation.dart';
import 'package:flippo_navigation/flippo_navigation.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int waterLevelCurrentStep = 0;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Tracker',
      style: optionStyle,
    ),
    Text(
      'Index 2: Fitness',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];
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

  IconData icon = FontAwesomeIcons.minusCircle;
  Future<bool> onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit Dieten?"),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.of(context).pop(true),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            primary: true,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
                size: 25.5,
              ),
            ),
            title: Text(
              'Dieten',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(53.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        'Welcome back, Name',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 20.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          const Color(0xff23b6e6).withOpacity(0.7),
                          const Color(0xff02d39a).withOpacity(0.5),
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Dieten',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Plan It. Achieve It.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.home,
                      color: Color(0xff23b6e6),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Calorie Tracker",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.fastfood,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: CalorieTracker(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Meal Planner",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.local_dining,
                      color: Colors.pinkAccent,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: MealPlanner(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Fit@Home",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.fitness_center,
                      color: Color(0xFFffd31d),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: FitAtHome(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Text(
                      "Profile",
                      style: TextStyle(
                          color: Color(0xFF12947f),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.account_circle,
                      color: Colors.green,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: MyProfile(),
                          ));
                    },
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 60.0,
                    height: 50,
                    child: Divider(
                      height: 30.0,
                      thickness: 1.2,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      MaterialButton(
                        padding: EdgeInsets.all(0.0),
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: SplashScreen(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xff23b6e6),
                                    const Color(0xff02d39a),
                                  ])),
                          width: 100.0,
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            'Version: 1.0.0',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ]),
              child: SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                    gap: 5,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.grey[800],
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                        backgroundColor: Colors.pink,
                      ),
                      GButton(
                        icon: Icons.local_dining,
                        text: 'Tracking',
                        backgroundColor: Color(0xFFffd31d),
                      ),
                      GButton(
                        icon: Icons.fitness_center,
                        text: 'Fitness',
                        backgroundColor: Colors.blue,
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                        backgroundColor: Colors.green,
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                        if (index == 0) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: Dashboard(),
                              ));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: CalorieTracker(),
                              ));
                        }
                        if (index == 2) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FitAtHome(),
                              ));
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: MyProfile(),
                              ));
                        }
                      });
                    }),
              ))),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: Container(
                      height: 1.5,
                      width: 430.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                  ),
//                SizedBox(
//                  height: 20.0,
//                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 25.0),
//                    Text(
//                      'Daily Activity Progress',
//                      style: TextStyle(
//                        color: Colors.purple,
//                        fontSize: 21.0,
//                        fontWeight: FontWeight.w800,
//                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RadialProgressSteps(
                        achievedSteps: 2000,
                        totalSteps: 6000,
                      ),
                      RadialProgressConsumed(
                        consumedCalories: 1500,
                        totalCalories: 3000,
                      ),
                      RadialProgressBurnt(
                        totalCalories: 5000,
                        burntCalories: 2000,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 18.0),
                      Text(
                        'Towards Goal',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 21.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
                    child:
                        LineChartCalories(), //ToDo graph values to be plotted from database
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: Container(
                      height: 2.5,
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Water Log',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 21.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          WaterLevelIndicator(
                            currentStep: waterLevelCurrentStep,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Glasses',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (waterLevelCurrentStep >= 0 &&
                                    waterLevelCurrentStep <= 12) {
                                  waterLevelCurrentStep++;
                                } else {
                                  waterLevelCurrentStep = 0;
                                }
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.plusCircle,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                          waterLevelCurrentStep != 0
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (waterLevelCurrentStep >= 0 &&
                                          waterLevelCurrentStep <= 12) {
                                        waterLevelCurrentStep--;
                                      } else {
                                        waterLevelCurrentStep = 0;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.minusCircle,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Stay Hydrated for your well being!',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: Container(
                      height: 2.5,
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: MaterialButton(
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: WorkoutsIntro(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Create your Workout Plan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: MaterialButton(
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: MealPlanner(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Create your Meal Plan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
