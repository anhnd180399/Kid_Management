import 'package:device_apps/device_apps.dart';

class AppTimePeriod {
  int id;
  DateTime startTime;
  DateTime endTime;
  List<String> appPaths;

  AppTimePeriod({this.id, this.startTime, this.endTime, this.appPaths});

}
