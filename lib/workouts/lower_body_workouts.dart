import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathoncalorie/calorie_tracker/calender_timeline.dart';
import 'package:hackathoncalorie/calorie_tracker/calorie_tracker.dart';
import 'package:hackathoncalorie/calorie_tracker/status_timeline.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:hackathoncalorie/dashboard/line_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_consumed.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_steps.dart';
import 'package:hackathoncalorie/dashboard/radial_progress_burnt.dart';
import 'package:hackathoncalorie/dashboard/water_level_indicator.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:hackathoncalorie/fit_at_home/fit_at_home.dart';
import 'package:hackathoncalorie/fit_at_home/radial_progress_calories_fit_at_home.dart';
import 'package:hackathoncalorie/fit_at_home/radial_progress_miles_fit_at_home.dart';
import 'package:hackathoncalorie/fit_at_home/radial_progress_steps_fit_at_home.dart';
import 'package:hackathoncalorie/meal_planner/meal_planner.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/splash_screen/splash_screen.dart';
import 'package:hackathoncalorie/workouts/grid_upper_body_workouts_tile.dart';
import 'package:hackathoncalorie/workouts/grid_workouts_tile.dart';
import 'package:hackathoncalorie/workouts/workouts.dart';
import 'package:hackathoncalorie/workouts/workouts_intro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'grid_lower_body_workouts_tile.dart';

class LowerBodyWorkouts extends StatefulWidget {
  static String id = 'lower_body_workouts';

  @override
  _LowerBodyWorkoutsState createState() => _LowerBodyWorkoutsState();
}

class _LowerBodyWorkoutsState extends State<LowerBodyWorkouts> {
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

  int _selectedIndex = 2;
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Dashboard(),
                        ));
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
            preferredSize: Size.fromHeight(90.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Upper Body Workouts',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FitAtHome(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: 150.0,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Fitness',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: Workouts(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff23b6e6),
                                  const Color(0xff02d39a),
                                ])),
                        width: 150.0,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Workouts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
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
                    height: 2.5,
                    width: 250.0,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                GridLowerBodyWorkoutsTile(
                  title: 'Bodyweight Squats',
                  image: 'assets/images/back-workout.jpg',
                  description:
                      'Stand with your feet about shoulder-width apart and slightly turned out with your weight in your heels.Hinge forward at your hips and sit your butt back into a squat. Bend your knees until your thighs are parallel to the ground.Drive through your heels to stand back up straight. Squeeze your butt and keep your core tight as you stand.',
                ),
                SizedBox(
                  height: 15.0,
                ),
                GridLowerBodyWorkoutsTile(
                  title: 'Reverse Lungs with Knee Lifts',
                  image: 'assets/images/back-workout.jpg',
                  description:
                      'Start standing with your feet about shoulder-width apart. Step backwards with your left foot, landing on the ball of your foot and bending both knees to create two 90-degree angles. Push through your right heel to return to standing. As you stand up, thrust your left knee toward your chest. Repeat on the other side.',
                ),
                SizedBox(
                  height: 15.0,
                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Plié Squat Calf Raises',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand with feet wider than shoulder-width apart, toes turned out, and hands on hips or in front of your chest. Squat until your thighs are parallel to floor. While staying in a squat, lift both heels off the ground and hold for two seconds. Lower heels back down.',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Squat Jumps',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Start standing with your feet hip-width apart. Hinge forward at the hips and place your palms on the floor, bending your knees as needed to reach. Walk your hands forward so youʼre in a plank position. Walk your hands back toward your feet and stand up. Thatʼs 1 rep. Do 10 total. Rest for 30 seconds. To make it harder, do a pushup at the bottom, keeping your elbows close to your torso and dropping to your knees if needed.',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'High Knee Toe Taps',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand with your feet slightly wider than hip-width apart. Hinge forward at your hips and sit your butt back into a squat. Bend your knees until your thighs are parallel to the ground. Jump up into the air as high as you can and straighten out your legs. Swing your arms down by your sides for momentum, and keep your back straight and chest lifted. Land back on the floor with soft knees. Go directly into another squat',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Side Lungs',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand with your feet hip-width apart. Take a big step out to your right. Bend your right knee and push your butt back, keeping your left leg straight. Keep your chest lifted and core tight. Repeat on the other side.',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Curtsy Lunges',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand tall with your feet hip-width apart. Step your right leg diagonally behind your left leg and bend your knees to lower into a lunge. Push through your left heel to stand and bring your right leg back to start. Repeat on the other side.',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Pistol Squats',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand with your feet together. Lift your left leg a few inches and extend it forward, foot flexed. Bend your right knee, hinge forward at the hips, and sit back into a squat while lifting your left leg to hip height. Extend your arms out for balance. Try to bend your knee to 90 degrees if you',
//                ),
//                SizedBox(
//                  height: 15.0,
//                ),
//                GridLowerBodyWorkoutsTile(
//                  title: 'Single-Leg Calf Raises',
//                  image: 'assets/images/back-workout.jpg',
//                  description:
//                      'Stand with your feet hip-width apart. Raise your left knee to hip level, toes pointed, hands on hips or behind your head (whatever keeps you stable). Keep your core tight as you lift your right heel as high as you can off the floor, balancing on the ball of your foot. Hold for three seconds, then lower the heel back down. Repeat on the other side.',
//                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
