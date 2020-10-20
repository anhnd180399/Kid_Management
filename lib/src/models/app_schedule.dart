import 'package:kid_management/src/models/app_time_period.dart';

class AppScheduleModel {
  int id;
  String name;
  bool active;
  List<AppTimePeriod> appTimePeriods;
  Set<int> dayOfWeeks;

  AppScheduleModel(
      {this.id, this.name, this.active, this.appTimePeriods, this.dayOfWeeks});

  // int get getId => id;
  // String get getName => name;
  // Color get getColor => color;
  // bool get isActive => active;
  // List<AppTimePeriod> get getAppTimePeriods => appTimePeriods;

  String toDayOfWeeksString() {
    String result = '';

    for (int i = 0; i < this.dayOfWeeks.length; i++) {
      int d = this.dayOfWeeks.elementAt(i);
      String dayString = '';
      if (d == 2) dayString = 'Monday';
      if (d == 3) dayString = 'Tuesday';
      if (d == 4) dayString = 'Wednesday';
      if (d == 5) dayString = 'Thursday';
      if (d == 6) dayString = 'Friday';
      if (d == 7) dayString = 'Saturday';
      if (d == 8) dayString = 'Sunday';

      result += dayString + ', ';
    }

    return result.substring(0, result.length - 2);
  }
}
