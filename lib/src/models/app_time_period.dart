import 'package:device_apps/device_apps.dart';

class AppTimePeriod {
  int id;
  DateTime startTime;
  DateTime endTime;
  List<Application> apps;

  AppTimePeriod({this.id, this.startTime, this.endTime, this.apps});

  List<ApplicationWithIcon> get getApps => apps;
  DateTime get getStartTime => startTime;
  DateTime get getEndTime => endTime;
  int get getId => id;
}
