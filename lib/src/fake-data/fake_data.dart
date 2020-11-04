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
  static List<AppScheduleModel> listSchedule;
  static bool isLogin = false;
  // fake data for creating app schedule
  // temp app list to used for schedule creating
  static List<ApplicationSystem> tempAppList = [];
  static String tmpStartTime = '';
  static String tmpEndTime = '';

  static void init(List<ApplicationSystem> value) {
    print('intializing data...');
    listApplication = value;
    notifications = getNotifications();
    listSchedule = appSchedules();
    if (listApplication == null)
      listApplication = new List<ApplicationSystem>();
  }

  static setToSchedule(
      AppScheduleModel appScheduleModel, ApplicationSystem applicationSystem) {
    var schedule =
        listSchedule.firstWhere((element) => element.id == appScheduleModel.id);
    if (schedule != null) {
      appScheduleModel.appTimePeriods[0].apps.add(applicationSystem);
    }
  }

  static setApplicationStatus(
      ApplicationSystem applicationSystem, bool isBlock) {
    var app = listApplication.firstWhere((element) =>
        element.application.apkFilePath ==
        applicationSystem.application.apkFilePath);
    app.isBlock = isBlock;
    if (isBlock) {
      listSchedule.forEach((element) {
        element.appTimePeriods.forEach((elementApp) {
          elementApp.apps.removeWhere((element) =>
              element.application.apkFilePath ==
              applicationSystem.application.apkFilePath);
        });
      });
    }
  }

  static List<ApplicationSystem> getListNonBlockingApplication() {
    var listData =
        listApplication.where((element) => !element.isBlock).toList();
    return listData;
  }

  static AppScheduleModel getScheduleById(int scheduleId) {
    var app = listSchedule?.singleWhere((element) => element.id == scheduleId);
    return app;
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
        dayOfWeeks: {3, 4, 7}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: appTimePeriods(),
        id: 2,
        name: 'LEARNING',
        dayOfWeeks: {2, 8}));
    schedules.add(AppScheduleModel(
        active: false,
        appTimePeriods: appTimePeriods(),
        id: 3,
        name: 'WORKING',
        dayOfWeeks: {3, 5}));

    return schedules;
  }

  static List<AppTimePeriod> appTimePeriods() {
    List<AppTimePeriod> periods = [
      AppTimePeriod(
          id: 1,
          startTime: '07:00 AM',
          endTime: '10:00 AM',
          apps: appListFirst()),
      AppTimePeriod(
          id: 2,
          startTime: '10:00 AM',
          endTime: '01:00 PM',
          apps: appListSecond()),
      AppTimePeriod(
          id: 3,
          startTime: '02:00 PM',
          endTime: '04:00 PM',
          apps: appListThird()),
      AppTimePeriod(
          id: 4,
          startTime: '05:00 PM',
          endTime: '09:00 PM',
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

  static Future<void> initData() async {
    // return appListOne() + appListTwo() + appListThree();
    List<ApplicationSystem> listMyApp = new List<ApplicationSystem>();
    var listApp = await getAllApps();
    for (var item in listApp) {
      if (item.appName != "Kid Space" &&
          item.packageName != "com.android.settings") {
        listMyApp.add(ApplicationSystem.toApplication(item));
      }
    }
    init(listMyApp);
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
        AddressHistory(address: 'Xóm Lưới, Vũng Tàu, Vietnam', time: '11:00 AM')
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
