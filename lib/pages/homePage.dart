import 'package:flutter/material.dart';
import 'package:odc/widgets/games.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ODC"),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.blue[900],
              child: TabBar(tabs: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("GAMES"),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("TEAMS"),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.maxFinite,
              child: TabBarView(children: [
                Games(),
                Text("Teams"),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
