import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/app_schedule.dart';
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

  @override
  initState() {
    super.initState();
  }

  Widget _appListItem(ApplicationSystem app) {
    return Column(
      children: [
        Row(
          children: [
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
            Text(app.name)
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var periods = widget.appScheduleModel.appTimePeriods;
    for (int i = 0; i < periods.length; i++) {
      _timePeriodsCollapse.add(false);
    }
    print(_timePeriodsCollapse.length);
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          var period = widget.appScheduleModel.appTimePeriods[index];
          return Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            decoration: BoxDecoration(
                color: AppColor.grayLight,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Text(
                              '${period.startTime} - ${period.endTime}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: AppColor.mainColor,
                              ),
                            ),
                            Icon(
                              _timePeriodsCollapse[index]
                                  ? Icons.keyboard_arrow_right
                                  : Icons.keyboard_arrow_down,
                              size: 24.0,
                            )
                          ],
                        ),
                      ),
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
                  visible: !_timePeriodsCollapse[index],
                )
              ],
            ),
          );
        },
        itemCount: widget.appScheduleModel.appTimePeriods.length,
      ),
    );
  }
}
