import 'package:device_apps/device_apps.dart';
import 'package:kid_management/src/models/address_history.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/app_time_period.dart';
import 'package:kid_management/src/models/blacklist_item_model.dart';
import 'package:kid_management/src/models/location_history.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/models/notification_model.dart';
import 'package:kid_management/src/models/suggested_item_model.dart';

// class to generate fake data for whole app

class FakeData {
  static List<NotificationModel> notifications;
  static List<ApplicationSystem> listApplication;
  static AppScheduleModel appScheduleHomeWork;

  static void init(List<ApplicationSystem> value) {
    print('intializing data...');
    notifications = getNotifications();
    listApplication = value;
  }

  static setApplicationStatus(bool isBlock) {}
  static List<ApplicationSystem> getListNonBlockingApplication() {
    return listApplication.where((element) => !element.isBlock).toList();
  }

  static openApp(ApplicationSystem app) {
    DeviceApps.openApp(app.application.packageName);
  }

  static List<ApplicationSystem> getListAllApplication() {
    return listApplication;
  }

  static List<AppScheduleModel> appSchedules() {
    List<AppScheduleModel> schedules = [];
    schedules.add(AppScheduleModel(
        active: true,
        appTimePeriods: appTimePeriods(),
        id: 1,
        name: 'HOME WORK',
        dayOfWeeks: {3, 7}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: appTimePeriods(),
        id: 2,
        name: 'LEARNING',
        dayOfWeeks: {2, 8}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: null,
        id: 2,
        name: 'WORKING',
        dayOfWeeks: {3, 5}));

    return schedules;
  }

  static List<AppTimePeriod> appTimePeriods() {
    List<AppTimePeriod> periods = [
      AppTimePeriod(
          id: 1,
          startTime: '7:00 AM',
          endTime: '10:00 AM',
          apps: appListFirst()),
      AppTimePeriod(
          id: 2,
          startTime: '10:00 PM',
          endTime: '12:00 PM',
          apps: appListSecond()),
      AppTimePeriod(
          id: 3,
          startTime: '12:00 PM',
          endTime: '16:00 PM',
          apps: appListThird()),
      AppTimePeriod(
          id: 4,
          startTime: '16:00 PM',
          endTime: '21:00 PM',
          apps: appListFourth())
    ];

    return periods;
  }

  static List<ApplicationSystem> appListFirst() {
    var skipCount = (getListNonBlockingApplication().length / 4).round();
    int index = 0;
    return getListNonBlockingApplication()
        .skip(skipCount * index)
        .take(skipCount)
        .toList();
  }

  static List<ApplicationSystem> appListSecond() {
    var skipCount = (getListNonBlockingApplication().length / 4).round();
    int index = 1;
    return getListNonBlockingApplication()
        .skip(skipCount * index)
        .take(skipCount)
        .toList();
  }

  static List<ApplicationSystem> appListThird() {
    var skipCount = (getListNonBlockingApplication().length / 4).round();
    int index = 2;
    return getListNonBlockingApplication()
        .skip(skipCount * index)
        .take(skipCount)
        .toList();
  }

  static List<ApplicationSystem> appListFourth() {
    var skipCount = (getListNonBlockingApplication().length / 4).round();
    int index = 3;
    return getListNonBlockingApplication()
        .skip(skipCount * index)
        .take(skipCount)
        .toList();
  }

  static Future<List<ApplicationSystem>> allAppsAsync() async {
    // return appListOne() + appListTwo() + appListThree();
    List<ApplicationSystem> listMyApp = new List<ApplicationSystem>();
    var listApp = await getAllApps();
    for (var item in listApp) {
      if (item.appName != "Kid Space" &&
          item.packageName != "com.android.settings") {
        listMyApp.add(ApplicationSystem.toApplication(item));
      }
    }
    return listMyApp;
  }

  static Future<List<Application>> getAllApps() async {
    return await DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true);
  }

  static List<LocationHistory> recentLocationHistories() {
    return [
      LocationHistory(id: 1, date: '21/10/2020', addressHistories: [
        AddressHistory(address: '107 Lê Văn Việt, Q9, TP.HCM', time: '8:20 AM'),
        AddressHistory(address: 'Phú Hữu, Q9, TP.HCM', time: '9:20 AM')
      ]),
      LocationHistory(id: 2, date: '20/10/2020', addressHistories: [
        AddressHistory(address: 'Vũng Tàu, Vietnam', time: '10:00 AM'),
        AddressHistory(
            address: 'Chợ Xóm Lưới, Vũng Tàu, Vietnam', time: '11:00 AM')
      ])
    ];
  }

  static List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
          msg: 'Your kid has used Garena app!',
          time: '3mins ago',
          isRead: false),
      NotificationModel(
          msg: 'Your kid has used Duolingo app!',
          time: '10mins ago',
          isRead: false),
      NotificationModel(
          msg: 'Your kid try to access google.com!',
          time: '15mins ago',
          isRead: false),
      NotificationModel(
          msg: 'Your kid browsed garena.vn!', time: '20mins ago', isRead: false)
    ];
  }

  static List<BlacklistItemModel> blacklistItems() {
    return [
      BlacklistItemModel(url: 'google.com'),
      BlacklistItemModel(url: 'facebook.com'),
      BlacklistItemModel(url: 'youtube.com'),
      BlacklistItemModel(url: 'garena.vn'),
      BlacklistItemModel(url: 'y8.vn')
    ];
  }

  static List<SuggestedItemModel> suggestedItems() {
    return [
      SuggestedItemModel(url: 'duolingo.com'),
      SuggestedItemModel(url: 'wiki.com'),
      SuggestedItemModel(url: 'genk.vn'),
      SuggestedItemModel(url: 'vnexpress.vn'),
      SuggestedItemModel(url: 'coursera.com')
    ];
  }
}
