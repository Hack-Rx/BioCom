import 'package:flutter/material.dart';

class GridWorkoutsTile extends StatelessWidget {
  final String title;
  String image;
  final Function onPressed;
  GridWorkoutsTile({this.title, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 110.0,
      decoration: BoxDecoration(
        color: Colors.white,
//        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Card(
        elevation: 5.0,
        child: MaterialButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                width: 120.0,
              ),
              SizedBox(
                width: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                      fontFamily: 'Nunito',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                ],
              ),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
