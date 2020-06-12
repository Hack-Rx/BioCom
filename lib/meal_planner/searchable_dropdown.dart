import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SearchDropdown extends StatefulWidget {
  static String id = 'search_dropdown';

  SearchDropdown({this.titleText, this.heading});

  final String titleText;
  final String heading;

  @override
  _SearchDropdownState createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  String selectedValue;
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text(titleText),
      value: titleText,
    )
  ];

  static String get titleText => null;
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      widget.heading: SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Select any"),
        ),
        searchHint: "Select any",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.isNotEmpty
              ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Save without selection");
        },
        isExpanded: true,
      ),
    };
    return Column(
      children: widgets
          .map((title, options) {
            return (MapEntry(
                title,
                Center(
                    child: Card(
                        elevation: 8.0,
                        margin: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text("$title"),
                              options,
                            ],
                          ),
                        )))));
          })
          .values
          .toList(),
    );
  }
}
