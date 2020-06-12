import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile.dart';

class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<List<Profile>>(context);
    profile.forEach((profile) {
      print(profile.age);
      print(profile.weight);
      print(profile.height);
    });
    return Container();
  }
}
