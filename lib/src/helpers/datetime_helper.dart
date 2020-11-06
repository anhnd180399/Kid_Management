import 'package:intl/intl.dart';

class DateTimeHelper {
  // convert 12-hours time format string to Datetime obj
  static DateTime toDateTime(String timeString) {
    String startTimeString = timeString.split(' ')[0];
    // AM or PM
    String startTimeMode = timeString.split(' ')[1];

    String startHourString = startTimeString.split(':')[0];
    startHourString =
        startHourString.length == 1 ? '0$startHourString' : startHourString;

    startHourString = startTimeMode == 'AM'
        ? startHourString
        : (int.parse(startHourString) + 12).toString();
    String startMinuteString = startTimeString.split(':')[1];

    String currentDateString = DateTime.now().toString().split(' ')[0];

    DateTime dateTimeObj = DateTime.parse(
        '$currentDateString $startHourString:$startMinuteString:00');

    return dateTimeObj;
  }

  static String minuteToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    parts.forEach((element) {
      print(element);
    });
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  static int compareTwoDateInSeconds(DateTime dateOne, DateTime dateTwo) {
    var diff = dateOne.difference(dateTwo);
    return diff.inSeconds;
  }

  static String toTime12Hours(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}
