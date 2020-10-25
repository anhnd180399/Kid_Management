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
      switch(d) {
        case 2 : dayString = 'Monday'; break;
        case 3 : dayString = 'Tuesday'; break;
        case 4 : dayString = 'Wednesday'; break;
        case 5 : dayString = 'Thursday'; break;
        case 6 : dayString = 'Friday'; break;
        case 7 : dayString = 'Saturday'; break;
        case 8 : dayString = 'Sunday';
      }
      result += dayString + ', ';
    }

    return result.substring(0, result.length - 2);
  }
}
