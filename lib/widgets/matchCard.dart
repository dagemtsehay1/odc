import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  final game;
  const MatchCard({Key? key, @required this.game}) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  void handleOnClick(context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Row(
            children: [
              Expanded(
                child: Text(widget.game["home_team"]["full_name"]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("vs"),
                ),
              ),
              Expanded(
                child: Text(widget.game["visitor_team"]["full_name"]),
              ),
            ],
          ),
          content: Column(
            children: [
              Divider(
                height: 30,
                thickness: 3,
                color: Colors.grey[700],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(widget.game["home_team"]["abbreviation"]),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                      child: Text(widget.game["visitor_team"]["abbreviation"])),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(widget.game["home_team_score"].toString()),
                  ),
                  Expanded(child: Text("Score")),
                  Expanded(
                      child:
                          Text(widget.game["visitor_team_score"].toString())),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(widget.game["home_team"]["city"]),
                  ),
                  Expanded(child: Text("City")),
                  Expanded(child: Text(widget.game["visitor_team"]["city"])),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

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
      child: GestureDetector(
        onTap: () {
          handleOnClick(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.game["home_team"]["full_name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.game["home_team"]["abbreviation"],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  widget.game["date"].toString().substring(0, 10),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.greenAccent[400],
                  child: Text(
                    widget.game["home_team_score"].toString() +
                        " - " +
                        widget.game["visitor_team_score"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.game["status"].toString().substring(0, 5),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.game["visitor_team"]["full_name"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.game["visitor_team"]["abbreviation"],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
