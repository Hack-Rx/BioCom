import 'package:flutter/material.dart';


class MealFromList extends StatefulWidget {
  static String id = 'meal_from_list';
  @override
  _MealFromListState createState() => _MealFromListState();
}

class _MealFromListState extends State<MealFromList> {

  final List<String> entries = <String>['Poha', 'Jalebi', 'Omellete', 'Dhokla', 'Masala Tea', 'Uttapam', 'Kachori', 'Chane ki Dal', 'Chicken', 'Dal Makhani', 'Gulab Jamun', 'Idli','Paneer', 'Rice', 'Chapati'];
  final List<int> count = <int>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  final List<int> calorie = <int>[100,100,100,100,100,100,100,100,100,100,100,100,100,100,100];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
          ),
          appBar: AppBar(
            primary: true,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25.5,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Dieten',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: ListView.builder(
            padding: const EdgeInsets.all(6),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: Text('${entries[index]}', textAlign: TextAlign.left,style:
                    TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  Expanded(
                    child: Text('${count[index]} item/bowl', textAlign: TextAlign.right,style: TextStyle(
                        fontWeight: FontWeight.w500
                    )),
                  ),
                  Expanded(
                    child: Text('${calorie[index] * count[index]} Calories', textAlign: TextAlign.right,style: TextStyle(
                        fontWeight: FontWeight.w500
                    )),
                  ),
                  Expanded(
                    child: MaterialButton(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.add, color: Colors.blue),
                      ),
                      onPressed: (){
                        setState(() {
                          count[index]++;
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

