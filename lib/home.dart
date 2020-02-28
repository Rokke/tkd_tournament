import 'package:flutter/material.dart';
import 'package:tkd_tournament/repo/tournament_repo.dart';
import 'package:tkd_tournament/view_tournament/view_tournament.dart';

class HomeScreen extends StatelessWidget {
  final RepoTournament repo;
  const HomeScreen(this.repo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: repo.tournaments
          .map(
            (e) => FlatButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewTournament(e))),
              child: Text('${e.name} (${e.children.length} ringer)'),
              color: Theme.of(context).buttonColor,
            ),
          )
          .toList(),
    );
  }
}
