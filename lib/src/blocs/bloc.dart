import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/app_time_period.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;

class Bloc {
  //Our pizza house
  final fakeData = StreamController<AppScheduleModel>();
  final collapseData = StreamController<List<bool>>();
  Stream<AppScheduleModel> get schedule => fakeData.stream;
  Stream<List<bool>> get collapse => collapseData.stream;
  Bloc();
  final databaseReference = FirebaseDatabase.instance.reference();
  void listenFirebaseChange() {
    bool hasData = false;
    try {
      databaseReference.child(FakeData.parentName).onValue.listen((event) {
        if (FakeData.isChildMode) {
          var snapshot = event.snapshot;
          var listSchedule = snapshot.value[CONSTANT.ROOT_SCHEDULES] as List;
          if ((listSchedule?.length ?? true) != 0) {
            var schedule = listSchedule[0];
            var scheduleData = FakeData.convertToSchedule(schedule);
            if (scheduleData.active) {
              hasData = true;
              refreshSchedule(scheduleData);
            }
          }
        }
      });
    } catch (e) {
      print('Error when read firebase: ' + e.message);
    }
    if (!hasData) {
      refreshSchedule(null);
    }
  }

  //Validate if pizza can be baked or not. This is John
  final refreshData =
      StreamTransformer<AppScheduleModel, AppScheduleModel>.fromHandlers(
          handleData: (schedule, sink) {
    sink.add(schedule);
  });

  //refresh order
  void refreshSchedule(AppScheduleModel schedule) {
    fakeData.sink.add(schedule);
  }

  void refreshTimePeriodCollapse(List<AppTimePeriod> periods) {
    var listCollapse = new List<bool>();
    for (int i = 0; i < periods.length; i++) {
      listCollapse.add(false);
    }
    collapseData.sink.add(listCollapse);
  }
}
