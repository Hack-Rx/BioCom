import 'package:flutter/material.dart';
import 'package:timeline_node/timeline_node.dart';

class StatusTimelineObject {
  final TimelineNodeStyle style;
  final String message;

  StatusTimelineObject({this.style, this.message});
}

class StatusTimeline extends StatefulWidget {
  final List<StatusTimelineObject> timelineObject = [
    StatusTimelineObject(
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        style: TimelineNodeStyle(lineType: TimelineNodeLineType.BottomHalf)),
    StatusTimelineObject(
        message:
            'Maecenas non bibendum ante, et volutpat diam. Praesent eu interdum urna. Ut rhoncus, lectus sed condimentum dictum, dolor odio accumsan risus, eget malesuada enim lectus ut diam.',
        style: TimelineNodeStyle(
            lineType: TimelineNodeLineType.Full, lineColor: Colors.red)),
    StatusTimelineObject(
        message:
            'Nullam tincidunt nunc libero, vel efficitur ex elementum quis. Nam non ex laoreet, imperdiet tellus vitae, finibus augue.',
        style: TimelineNodeStyle(
            lineType: TimelineNodeLineType.TopHalf, lineColor: Colors.green)),
    StatusTimelineObject(
        message:
            'Ut fringilla dui posuere, lobortis mauris vitae, pretium ipsum.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            lineType: TimelineNodeLineType.BottomHalf,
            lineWidth: 5)),
    StatusTimelineObject(
        message:
            'Ut fringilla dui posuere, lobortis mauris vitae, pretium ipsum.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            lineType: TimelineNodeLineType.Full,
            lineWidth: 5)),
    StatusTimelineObject(
        message:
            'Praesent nulla sapien, vestibulum eget tincidunt ac, suscipit eget libero. Aliquam finibus sed nisi sed ornare.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            lineType: TimelineNodeLineType.TopHalf,
            lineWidth: 5)),
  ];

  StatusTimeline({Key key}) : super(key: key);

  _StatusTimelineState createState() => _StatusTimelineState();
}

class _StatusTimelineState extends State<StatusTimeline> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.timelineObject.length,
      itemBuilder: (context, index) {
        return TimelineNode(
          style: this.widget.timelineObject[index].style,
          indicator: SizedBox(
            width: 10,
            height: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(this.widget.timelineObject[index].message),
              ),
            ),
          ),
        );
      },
    );
  }
}
