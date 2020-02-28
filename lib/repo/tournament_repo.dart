import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tkd_tournament/model/base_child.dart';
import 'package:tkd_tournament/model/court.dart';
import 'package:tkd_tournament/model/fight.dart';
import 'package:tkd_tournament/model/fighter.dart';
import 'package:tkd_tournament/model/tournament.dart';

class RepoTournament extends BaseChildren with ChangeNotifier {
//  List<Tournament> _tournaments;
  UnmodifiableListView<Tournament> get tournaments => UnmodifiableListView(children.map((e) => e as Tournament));
  _loadTournaments() async {
    children = [
      Tournament("Unity", this, courts: [Court(1, ""), Court(2, ""), Court(3, ""), Court(4, "")]),
      Tournament("Unity 2", this, courts: [
        Court(
          5,
          "",
        ),
        Court(6, "", fights: [
          Fight("101", chong: Fighter(1, "Ragnar Talgø", "NOR"), hong: Fighter(2, "Odin Talgø", "NOR")),
          Fight("106", chong: Fighter(3, "Tom Talgø", "NOR"), hong: Fighter(2, "Odin Talgø", "NOR")),
        ]),
        Court(7, "")
      ]),
      Tournament("En helt annen turnering", this,
          courts: [Court(8, ""), Court(9, ""), Court(10, ""), Court(11, ""), Court(12, ""), Court(13, "")]),
    ];
    print("Created repo");
    notifyListeners();
  }

  @override
  void add(BaseChildren tournament) {
    super.add(tournament);
    notifyListeners();
  }

  RepoTournament() : super() {
    print('tournamentRepo created');
    _loadTournaments();
  }
}
