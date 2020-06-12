import 'package:flutter/material.dart';

class GridShoulderWorkoutsTile extends StatelessWidget {
  final String title;
  String image;
  String description;
  GridShoulderWorkoutsTile({this.title, this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 430.0,
      decoration: BoxDecoration(
        color: Colors.white,
//        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Card(
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              width: 300.0,
              height: 200.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
                fontFamily: 'Nunito',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  fontFamily: 'Nunito',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
