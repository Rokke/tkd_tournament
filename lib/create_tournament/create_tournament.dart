import 'package:flutter/material.dart';

class CreateTournament extends StatefulWidget {
  CreateTournament({Key key}) : super(key: key);

  @override
  _CreateTournamentState createState() => _CreateTournamentState();
}

class _CreateTournamentState extends State<CreateTournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new tournament"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Her skal det lages ny turnering'),
          ],
        ),
      ),
    );
  }
}
