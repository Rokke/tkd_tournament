import 'package:flutter/material.dart';
import 'package:tkd_tournament/common/dialog.dart';
import 'package:tkd_tournament/model/court.dart';
import 'package:tkd_tournament/model/tournament.dart';
import 'package:tkd_tournament/view_tournament/courts.dart';

class ViewTournament extends StatefulWidget {
  Tournament tournament;
  ViewTournament(this.tournament, {Key key}) : super(key: key);

  @override
  _ViewTournamentState createState() => _ViewTournamentState();
}

class _ViewTournamentState extends State<ViewTournament> {
  _addNewCourt() async {
    print('Ny ring');
    final resp = await asyncInputDialog(context, 'Ønsker du å opprette en ny ring?', DialogType.DIALOG_YESNO);
    if (resp == "YES") widget.tournament.add(Court(5, ""));
  }

  @override
  Widget build(BuildContext context) {
    print('ViewTournament(${widget.tournament}');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tournament.name),
      ),
      body: CourtScreen(widget.tournament),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewCourt(),
        tooltip: 'Add tournament',
        child: Icon(Icons.add),
      ),
    );
  }
}
