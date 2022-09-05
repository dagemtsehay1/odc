import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatefulWidget {
  final team;
  const TeamCard({Key? key, @required this.team}) : super(key: key);

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.team["home_team"]["full_name"] +
                "(" +
                widget.team["home_team"]["abbreviation"] +
                ")",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "city: " + widget.team["home_team"]["city"],
            style: TextStyle(color: Colors.grey[500]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Division: " + widget.team["home_team"]["division"],
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
