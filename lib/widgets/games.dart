import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'matchCard.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  bool isLoading = true;
  var games = [];

  void getFromLocalMemory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic>? game = prefs.getStringList('games');
    if (game != null) {
      setState(() {
        games = game;
        isLoading = false;
      });
    }
  }

  void getGames() async {
    String url = "https://www.mocky.io/v2/5de8d38a3100000f006b1479";
    final prefs = await SharedPreferences.getInstance();
    try {
      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);
      await prefs.setStringList('games', data["data"]);
      setState(() {
        games = data["data"];
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
    getFromLocalMemory();
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
            maxHeight: (500 * games.length).toDouble(),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MatchCard(game: games[index]),
                  );
                }),
          );
  }
}
