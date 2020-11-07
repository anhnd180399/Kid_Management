import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/helpers/datetime_helper.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/app_time_period.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/EditTimePeriod.dart';

class ChildrenAppControlList extends StatefulWidget {
  AppScheduleModel appScheduleModel;

  ChildrenAppControlList({this.appScheduleModel});

  @override
  _ChildrenAppControlListState createState() => _ChildrenAppControlListState();
}

class _ChildrenAppControlListState extends State<ChildrenAppControlList> {
  List<bool> _timePeriodsCollapse = [];

  Timer _timer;

  @override
  initState() {
    super.initState();
  }

  Widget _appListItem(ApplicationSystem app) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Image.memory(
                app.icon,
                height: 30.0,
              ),
              padding: EdgeInsets.all(5.0),
            ),
            SizedBox(
              width: 20.0,
            ),
            Flexible(child: Text(app.name, textAlign: TextAlign.left)),
            Spacer(),
            Text('Remain: 3:00',
                style: TextStyle(color: AppColor.mainColor),
                textAlign: TextAlign.right),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var periods = widget.appScheduleModel.appTimePeriods;
    for (int i = 0; i < periods.length; i++) {
      setState(() {
        _timePeriodsCollapse.add(false);
      });
    }

    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          var period = widget.appScheduleModel.appTimePeriods[index];

          // check if the current period is in time period of now date time
          bool inProgress = comparePeriodWithNowDate(period) > 0 ? true : false;
          // calculate remaining time
          var remainingTimeInMinutes = DateTimeHelper.toDateTime(period.endTime)
              .difference(DateTime.now())
              .inMinutes;

          if (remainingTimeInMinutes > 0) {
            _timer = Timer.periodic(Duration(seconds: 60), (timer) {
              setState(() {});
            });
          }

          return Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 30.0, top: 10.0),
            decoration: BoxDecoration(
                color: AppColor.grayLight,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    inProgress
                        ? 'Time remaining: ${DateTimeHelper.minuteToString(remainingTimeInMinutes)}'
                        : 'Not Started',
                    style: TextStyle(
                        color: inProgress
                            ? AppColor.mainColor
                            : AppColor.grayDark),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // collapse toggle button
                      InkWell(
                        onTap: () {
                          setState(() {
                            _timePeriodsCollapse[index] =
                                !_timePeriodsCollapse[index];
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              color: AppColor.mainColor,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '${period.startTime} - ${period.endTime}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(
                        _timePeriodsCollapse[index]
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        size: 24.0,
                      )
                    ],
                  ),
                  // margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                ),
                Visibility(
                  child: period.apps.length == 0
                      ? null
                      : Column(
                          children: period.apps
                              .map((app) => _appListItem(app))
                              .toList(),
                        ),
                  visible: _timePeriodsCollapse[index],
                )
              ],
            ),
          );
        },
        itemCount: widget.appScheduleModel.appTimePeriods.length,
      ),
    );
  }

  int comparePeriodWithNowDate(AppTimePeriod period) {
    DateTime startTime = DateTimeHelper.toDateTime(period.startTime);
    DateTime endTime = DateTimeHelper.toDateTime(period.endTime);

    var now = DateTime.now();
    var startDiff = now.difference(startTime);
    var endDiff = endTime.difference(now);
    if (startDiff.inSeconds > 0 && endDiff.inSeconds > 0) {
      return 1;
    }

    return -1;
  }
}
