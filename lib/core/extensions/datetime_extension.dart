import 'package:timeago/timeago.dart' as timeago;

extension DateTimeX on DateTime {

  //for getting relative time

  String relativeTime() {
    try {
      return timeago.format(toLocal());
    } catch (e) {
      return "";
    }
  }
}
