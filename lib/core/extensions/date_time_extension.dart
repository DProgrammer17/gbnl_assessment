import 'package:intl/intl.dart';

extension Date on int{
  String dateString() {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    final dateFormat = DateFormat('dMMMy');

    return dateFormat.format(date);
  }
}