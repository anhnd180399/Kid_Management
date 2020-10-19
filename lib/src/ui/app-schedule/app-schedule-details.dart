import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/models/app_schedule.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class AppScheduleDetails extends StatefulWidget {
  AppScheduleModel schedule;

  AppScheduleDetails({this.schedule});

  @override
  _AppScheduleDetailsState createState() => _AppScheduleDetailsState();
}

class _AppScheduleDetailsState extends State<AppScheduleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: AppColor.mainColor,
                size: 35.0,
              ),
              onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    value: widget.schedule.active,
                    activeColor: AppColor.mainColor,
                    onChanged: (value) {
                      setState(() {
                        widget.schedule.active = value;
                      });
                    },
                  ),
                )),
                // schedule name here
                TextField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                      text: widget.schedule.name.toUpperCase()),
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0,
                              color: AppColor.mainColor,
                              style: BorderStyle.solid))),
                ),
                // the list of controlling apps
                Container(
                  child: widget.schedule.appTimePeriods == null
                      ? _emptyApp()
                      : _appList(),
                )
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 10.0,
              child: DayOfWeeks(dayOfWeeks: widget.schedule.dayOfWeeks))
        ],
      ),
    );
  }

  Widget _emptyApp() {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Opacity(
            opacity: 0.5,
            child: SvgPicture.asset('assets/images/app-schedule/empty_app.svg',
                width: 200.0)),
        Text("There's no app in control")
      ],
    );
  }

  Widget _appList() {}
}

class DayOfWeeks extends StatefulWidget {
  final Set<int> dayOfWeeks;

  DayOfWeeks({@required this.dayOfWeeks});

  @override
  _DayOfWeeksState createState() => _DayOfWeeksState();
}

class _DayOfWeeksState extends State<DayOfWeeks> {
  Widget _dayOfWeekChip(String label, int value, bool isActive) {
    return Container(
      width: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 1.0),
      child: RaisedButton(
        // press this chip to active or inactive day of week
        onPressed: () {
          setState(() {
            if (widget.dayOfWeeks.contains(value)) {
              widget.dayOfWeeks.remove(value);
            } else {
              widget.dayOfWeeks.add(value);
            }
          });
        },
        color: isActive ? AppColor.mainColor : Colors.white,
        elevation: 0,
        padding: EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(label.toUpperCase(),
            style: TextStyle(
              color: isActive ? Colors.white : AppColor.grayDark,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Text('DAYS OF WEEK'),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _dayOfWeekChip('mon', 2, this.widget.dayOfWeeks.contains(2)),
        _dayOfWeekChip('tue', 3, this.widget.dayOfWeeks.contains(3)),
        _dayOfWeekChip('wed', 4, this.widget.dayOfWeeks.contains(4)),
        _dayOfWeekChip('thu', 5, this.widget.dayOfWeeks.contains(5)),
        _dayOfWeekChip('fri', 6, this.widget.dayOfWeeks.contains(6)),
        _dayOfWeekChip('sat', 7, this.widget.dayOfWeeks.contains(7)),
        _dayOfWeekChip('sun', 8, this.widget.dayOfWeeks.contains(8))
      ])
    ]);
  }
}