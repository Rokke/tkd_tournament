import 'package:tkd_tournament/model/base_child.dart';
import 'package:tkd_tournament/model/fight.dart';

class Court extends BaseChildren {
  final int courtNumber;
  String link;
  @override
  dynamic get sortField => courtNumber;
//  Court(dynamic parent, this.courtNumber, this.link) : super(parent);
  Court(this.courtNumber, this.link, {BaseChildren parent, List<Fight> fights})
      : super(parent: parent, children: fights);
  @override
  String toString() {
    return "Court($courtNumber, $link)";
  }
}
