import 'package:kid_management/src/models/address_history.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/app_time_period.dart';
import 'package:kid_management/src/models/location_history.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/models/notification_model.dart';

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
      AppTimePeriod(id: 1, startTime: '7:00 AM', endTime: '9:00 AM', apps: appListOne()),
      AppTimePeriod(id: 2, startTime: '6:00 PM', endTime: '9:00 PM', apps: appListTwo()),
      AppTimePeriod(id: 3, startTime: '1:00 PM', endTime: '4:00 PM', apps: appListThree())
    ];

    return periods;
  }

  static List<MyApp> appListOne(){
    return [
      MyApp(
          name: 'Dog Care', icon: 'assets/images/app-icons/cocker-spaniel.svg'),
      MyApp(
          name: 'Game Center', icon: 'assets/images/app-icons/game-controller.svg'),
      MyApp(name: 'Grapes', icon: 'assets/images/app-icons/grapes.svg')
    ];
  }

  static List<MyApp> appListTwo(){
    return [
      MyApp(
          name: 'Global Health', icon: 'assets/images/app-icons/healthcare.svg'),
      MyApp(
          name: 'Corona Mask', icon: 'assets/images/app-icons/mask.svg'),
      MyApp(name: 'Water Fill', icon: 'assets/images/app-icons/mollusc.svg')
    ];
  }

  static List<MyApp> appListThree(){
    return [
      MyApp(
          name: 'Moneymate', icon: 'assets/images/app-icons/money-bag.svg'),
      MyApp(
          name: 'Tree Chrismas', icon: 'assets/images/app-icons/tree.svg'),
      MyApp(name: 'Turtle Ocean', icon: 'assets/images/app-icons/turtle.svg')
    ];
  }

  static List<MyApp> allApps(){
    return appListOne() + appListTwo() + appListThree();
  }

  static List<LocationHistory> recentLocationHistories(){
    return [
      LocationHistory(
        id: 1,
        date: '21/10/2020',
        addressHistories: [
          AddressHistory(address: '107 Lê Văn Việt, Q9, TP.HCM', time: '8:20 AM'),
          AddressHistory(address: 'Phú Hữu, Q9, TP.HCM', time: '9:20 AM')
        ]
      ),
      LocationHistory(
          id: 2,
          date: '20/10/2020',
          addressHistories: [
            AddressHistory(address: 'Vũng Tàu, Vietnam', time: '10:00 AM'),
            AddressHistory(address: 'Chợ Xóm Lưới, Vũng Tàu, Vietnam', time: '11:00 AM')
          ]
      )
    ];
  }

  static List<NotificationModel> notifications(){
    return [
      NotificationModel(
          msg: 'Your kid has used Garena app!',
          time: '3mins ago',
          isRead: false),
      NotificationModel(
          msg: 'Your kid has used Duolingo app!',
          time: '10mins ago',
          isRead: true),
      NotificationModel(
          msg: 'Your kid try to access google.com!',
          time: '15mins ago',
          isRead: true),
      NotificationModel(
          msg: 'Your kid browsed garena.vn!',
          time: '20mins ago',
          isRead: false)
    ];
  }
}
