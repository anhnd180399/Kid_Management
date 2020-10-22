import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/app_time_period.dart';
import 'package:kid_management/src/models/my_app.dart';

// class to generate fake data for whole app

class FakeData {
  static List<AppScheduleModel> appSchedules() {
    List<AppScheduleModel> schedules = [];
    schedules.add(AppScheduleModel(
        active: true,
        appTimePeriods: appTimePeriods(),
        id: 1,
        name: 'HOME WORK',
        dayOfWeeks: {2, 3}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: appTimePeriods(),
        id: 2,
        name: 'LEARNING',
        dayOfWeeks: {2, 8}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: appTimePeriods(),
        id: 2,
        name: 'WORKING',
        dayOfWeeks: {3, 5}));

    return schedules;
  }

  static List<AppTimePeriod> appTimePeriods() {
    List<AppTimePeriod> periods = [
      AppTimePeriod(id: 1, startTime: '7:00 AM', endTime: '9:00 AM', apps: [
        MyApp(
            name: 'Dog Care', icon: 'assets/images/app-icons/cocker-spaniel.svg'),
        MyApp(
            name: 'Game Center', icon: 'assets/images/app-icons/game-controller.svg'),
        MyApp(name: 'Grapes', icon: 'assets/images/app-icons/grapes.svg')
      ]),
      AppTimePeriod(id: 2, startTime: '6:00 PM', endTime: '9:00 PM', apps: [
        MyApp(
            name: 'Global Health', icon: 'assets/images/app-icons/healthcare.svg'),
        MyApp(
            name: 'Corona Mask', icon: 'assets/images/app-icons/mask.svg'),
        MyApp(name: 'Water Fill', icon: 'assets/images/app-icons/mollusc.svg')
      ]),
      AppTimePeriod(id: 3, startTime: '1:00 PM', endTime: '4:00 PM', apps: [
        MyApp(
            name: 'Moneymate', icon: 'assets/images/app-icons/money-bag.svg'),
        MyApp(
            name: 'Tree Chrismas', icon: 'assets/images/app-icons/tree.svg'),
        MyApp(name: 'Turtle Ocean', icon: 'assets/images/app-icons/turtle.svg')
      ])
    ];

    return periods;
  }
}
