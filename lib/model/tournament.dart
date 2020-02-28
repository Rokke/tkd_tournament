import 'dart:collection';

import 'package:tkd_tournament/model/base_child.dart';
import 'package:tkd_tournament/model/court.dart';

class Tournament extends BaseChildren {
  final String name;
  UnmodifiableListView<Court> get courts => UnmodifiableListView(children.map((e) => e as Court));
  @override
  Tournament(this.name, BaseChildren parent, {List<Court> courts}) : super(parent: parent, children: courts);
  @override
  String toString() {
    return "Tournament($name)-$parent";
  }
}
