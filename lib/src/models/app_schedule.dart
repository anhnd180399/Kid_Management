import 'package:flutter/cupertino.dart';
import 'package:kid_management/src/models/app_time_period.dart';

class AppScheduleModel {
  int id;
  String name;
  Color color;
  bool active;
  List<AppTimePeriod> appTimePeriods;

  AppScheduleModel(
      {this.id, this.name, this.color, this.active, this.appTimePeriods});

  int get getId => id;
  String get getName => name;
  Color get getColor => color;
  bool get isActive => active;
  List<AppTimePeriod> get getAppTimePeriods => appTimePeriods;
}
