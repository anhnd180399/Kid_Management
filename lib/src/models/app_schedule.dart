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
    if (this.dayOfWeeks.isEmpty) {
      return '';
    }

    String result = '';

    for (int i = 0; i < this.dayOfWeeks.length; i++) {
      int d = this.dayOfWeeks.elementAt(i);
      String dayString = '';
      switch (d) {
        case 2:
          dayString = 'Mon';
          break;
        case 3:
          dayString = 'Tue';
          break;
        case 4:
          dayString = 'Wed';
          break;
        case 5:
          dayString = 'Thu';
          break;
        case 6:
          dayString = 'Fri';
          break;
        case 7:
          dayString = 'Sat';
          break;
        case 8:
          dayString = 'Sun';
      }
      result += dayString + ', ';
    }

    return result.substring(0, result.length - 2);
  }
}
