import 'package:flutter/material.dart';
import 'package:hackathoncalorie/calorie_tracker/calorie_tracker.dart';
import 'package:hackathoncalorie/fit_at_home/fit_at_home.dart';
import 'package:hackathoncalorie/gender_page/gender_page.dart';
import 'package:hackathoncalorie/goal_page/goal_page.dart';
import 'package:hackathoncalorie/height_and_weight/height_and_weight.dart';
import 'package:hackathoncalorie/login_screen/login_screen.dart';
import 'package:hackathoncalorie/dashboard/dashboard.dart';
import 'package:hackathoncalorie/meal_planner/meal_planner.dart';
import 'package:hackathoncalorie/my_profile/my_profile.dart';
import 'package:hackathoncalorie/purpose/purpose.dart';
import 'package:hackathoncalorie/splash_screen/splash_screen.dart';
import 'package:hackathoncalorie/height_and_weight/results_page.dart';
import 'package:hackathoncalorie/tools/goals_page_with_loader.dart';
import 'package:hackathoncalorie/workouts/workouts.dart';

import 'login_screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          // Named Routes
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          GenderPage.id: (context) => GenderPage(),
          HeightAndWeight.id: (context) => HeightAndWeight(),
          ResultsPage.id: (context) => ResultsPage(),
          Purpose.id: (context) => Purpose(),
          GoalPage.id: (context) => GoalPage(),
          GoalsPageWithLoader.id: (context) => GoalsPageWithLoader(),
          Dashboard.id: (context) => Dashboard(),
          CalorieTracker.id: (context) => CalorieTracker(),
          MealPlanner.id: (context) => MealPlanner(),
          FitAtHome.id: (context) => FitAtHome(),
          Workouts.id: (context) => Workouts(),
          MyProfile.id: (context) => MyProfile(),
        });
  }
}
