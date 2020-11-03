import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/EditTimePeriod.dart';

class AppControlList extends StatefulWidget {
  AppScheduleModel appScheduleModel;

  AppControlList({this.appScheduleModel});

  @override
  _AppControlListState createState() => _AppControlListState();
}

class _AppControlListState extends State<AppControlList> {
  List<bool> _timePeriodsCollapse = [];

  @override
  initState() {
    super.initState();
  }

  Widget _appListItem(MyApp app) {
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
          return Column(
            children: [
              Container(
                child: Row(
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
                          Text('${period.startTime} - ${period.endTime}',
                              style: TextStyle(color: AppColor.grayDark)),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    Spacer(),
                    // add app button
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(100.0)),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        padding: EdgeInsets.all(5.0),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTimePriod(
                                startTime: period.startTime,
                                endTime: period.endTime,
                                apps: FakeData.getListNonBlockingApplication(),
                                selectedApps: period.apps,
                              ),
                            ));
                      },
                    )
                  ],
                ),
                margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
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
          );
        },
        itemCount: widget.appScheduleModel.appTimePeriods.length,
      ),
    );
  }
}
