import 'dart:io';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:select_dialog/select_dialog.dart';

class MealPlannerTile extends StatefulWidget {
  final String title;
  final Function onPressed;
  MealPlannerTile({this.title, this.onPressed});

  @override
  _MealPlannerTileState createState() => _MealPlannerTileState();
}

class _MealPlannerTileState extends State<MealPlannerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      width: MediaQuery.of(context).size.width,
      height: 68.0,
      child: Card(
        elevation: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
