import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/ui/app-schedule/app_control_list.dart';
import 'package:kid_management/src/ui/children_screens/components/children_app_control_list.dart';

class ChildrenAppScheduleScreen extends StatefulWidget {
  @override
  _ChildrenAppScheduleScreenState createState() =>
      _ChildrenAppScheduleScreenState();
}

class _ChildrenAppScheduleScreenState extends State<ChildrenAppScheduleScreen> {
  // fake data to demo
  AppScheduleModel _appSchedule = FakeData.appSchedules()[0];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/kid-screen/task.svg',
            width: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              "Hey! Let's see your schedule to use app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, letterSpacing: 2.0),
              softWrap: true,
            ),
          ),
          ChildrenAppControlList(
            appScheduleModel: _appSchedule,
          ),
        ],
      ),
    );
  }
}
