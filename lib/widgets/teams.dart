import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odc/widgets/teamCard.dart';
import 'matchCard.dart';

class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  bool isLoading = true;
  var teams = [];

  void getGames() async {
    String url = "https://www.mocky.io/v2/5de8d38a3100000f006b1479";
    try {
      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);
      setState(() {
        teams = data["data"];
        isLoading = false;
      });
    } catch (err) {
      print("err");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGames();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue[900],
            ),
          )
        : LimitedBox(
            maxHeight: (500 * teams.length).toDouble(),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TeamCard(team: teams[index]),
                  );
                }),
          );
  }
}
