import 'package:flutter/material.dart';
import 'package:tkd_tournament/model/tournament.dart';

class CourtScreen extends StatelessWidget {
  final Tournament tournament;
  const CourtScreen(this.tournament, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CourtScreen($tournament)');
    return Column(
      children: tournament.courts
          .map(
            (e) => FlatButton(
              onPressed: () => print(e),
              child: Text('${e.courtNumber} (${e.children?.length ?? 0} kamper)'),
              color: Theme.of(context).buttonColor,
            ),
          )
          .toList(),
    );
  }
}
