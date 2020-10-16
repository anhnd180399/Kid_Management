import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/create-app-schedule-step01.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;

class AppSchedule extends StatefulWidget {
  List<AppScheduleModel> appSchedules = [];

  @override
  _AppScheduleState createState() => _AppScheduleState();
}

class _AppScheduleState extends State<AppSchedule> {
  Widget _emptySchedule() {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Center(
          child: SvgPicture.asset(
            CONSTANT.URL_IMG_BG_APP_SCHEDULE_EMPTY,
            width: 200.0,
            height: 200.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Text(
            "There's no app schedule",
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 14.0),
          ),
        ),
        Center(
          child: Text("Tap Plus Icon to add new one",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.3), fontSize: 14.0)),
        )
      ],
    );
  }

  Widget _appSchedule(AppScheduleModel appSchedule) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          appSchedule.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        color: appSchedule.active
            ? appSchedule.color
            : appSchedule.color.withOpacity(0.5),
      ),
    );
  }

// create fake data
  List<AppScheduleModel> _appSchedules() {
    List<AppScheduleModel> schedules = [];
    schedules.add(AppScheduleModel(
        active: true,
        appTimePeriods: null,
        color: Color(0xffa29bfe),
        id: 1,
        name: 'HOME WORK'));
    schedules.add(AppScheduleModel(
        active: true,
        appTimePeriods: null,
        color: Color(0xffff7675),
        id: 2,
        name: 'LEARNING'));
    schedules.add(AppScheduleModel(
        active: true,
        appTimePeriods: null,
        color: Color(0xff00cec9),
        id: 2,
        name: 'WORKING'));

    return schedules;
  }

  @override
  Widget build(BuildContext context) {
    // generate fake data
    widget.appSchedules = _appSchedules();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GoBackButton(
            color: AppColor.mainColor,
            size: 35.0,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                'YOUR APP SCHEDULE',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                'Build your schedule to use apps',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: widget.appSchedules.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          var schedule = widget.appSchedules[index];
                          return _appSchedule(schedule);
                        },
                        itemCount: widget.appSchedules.length,
                      ),
                    )
                  : _emptySchedule(),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateAppScheduleStep01()));
          },
          child: Icon(Icons.add),
          backgroundColor: AppColor.mainColor,
        ));
  }
}
