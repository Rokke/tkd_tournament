import 'package:tkd_tournament/model/base_child.dart';
import 'package:tkd_tournament/model/fighter.dart';

class Fight extends BaseChildren {
  String matchNumber;
  Fighter chong;
  Fighter hong;
  String result;
  Fight(this.matchNumber, {BaseChildren parent, this.chong, this.hong, this.result}) : super(parent: parent);
}
