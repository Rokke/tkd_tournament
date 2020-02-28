import 'package:tkd_tournament/model/fighter.dart';

class RepoFighter {
  List<Fighter> fighters;
  RepoFighter() {
    print('RepoFighter');
    fighters = [
      Fighter(1, "Ragnar Talgø", "NOR"),
      Fighter(2, "Odin Talgø", "NOR"),
      Fighter(3, "Tom Talgø", "NOR"),
      Fighter(4, "Emmelie Sjöman", "SWE"),
    ];
  }
}
