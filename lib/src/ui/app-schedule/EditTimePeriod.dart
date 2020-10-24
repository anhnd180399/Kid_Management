import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class EditTimePriod extends StatefulWidget {
  String startTime;
  String endTime;
  List<MyApp> apps;
  List<MyApp> selectedApps;
  String tmpStartTime, tmpEndTime;

  EditTimePriod({this.startTime, this.endTime, this.apps, this.selectedApps});

  @override
  _EditTimePriodState createState() => _EditTimePriodState();
}

class _EditTimePriodState extends State<EditTimePriod> {
  bool _isAppSelected(String appName) {
    for (int i = 0; i < widget.selectedApps.length; i++) {
      var app = widget.selectedApps[i];
      if (app.name == appName) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    widget.tmpStartTime = widget.startTime;
    widget.tmpEndTime = widget.endTime;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GoBackButton(
            color: AppColor.mainColor,
            size: 35.0,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: AppColor.mainColor,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                          child: Text('Are you sure to delete?'),
                        ),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                'NO',
                                style: TextStyle(color: AppColor.mainColor),
                              )),
                          FlatButton(
                              onPressed: () {},
                              child: Text(
                                'YES',
                                style: TextStyle(color: AppColor.mainColor),
                              )),
                        ],
                      );
                    },
                  );
                })
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ChangeTimeDialog(
                      startTime: widget.startTime,
                      endTime: widget.endTime,
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.startTime} - ${widget.endTime}',
                    style: TextStyle(fontSize: 25.0, color: AppColor.mainColor),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColor.mainColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: size.height * 0.6,
              child: ListView.builder(
                itemCount: widget.apps.length,
                itemBuilder: (context, index) {
                  var app = widget.apps[index];
                  return CustomChekboxListItem(
                    isSelected: _isAppSelected(app.name),
                    title: app.name,
                    icon: app.icon,
                  );
                },
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColor.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}

class ChangeTimeDialog extends StatefulWidget {
  String startTime;
  String endTime;

  ChangeTimeDialog({this.startTime, this.endTime});

  @override
  _ChangeTimeDialogState createState() => _ChangeTimeDialogState();
}

class _ChangeTimeDialogState extends State<ChangeTimeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Change time'),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                String timeString = widget.startTime.split(' ')[0];
                String hour = timeString.split(':')[0];
                String min = timeString.split(':')[1];
                hour = hour.length <= 1 ? '0' + hour : hour;
                String dateTimeString =
                    '1999-03-25 ' + hour + ':' + min + ':00';
                DatePicker.showTime12hPicker(
                  context,
                  currentTime: DateTime.parse(dateTimeString),
                  onConfirm: (time) {
                    print('ahihi');
                    setState(() {
                      widget.startTime = DateFormat('hh:mm a').format(time);
                    });
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(widget.startTime),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.mainColor,
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            GestureDetector(
              onTap: () {
                String timeString = widget.endTime.split(' ')[0];
                String hour = timeString.split(':')[0];
                String min = timeString.split(':')[1];
                hour = hour.length <= 1 ? '0' + hour : hour;
                String dateTimeString =
                    '1999-03-25 ' + hour + ':' + min + ':00';
                DatePicker.showTime12hPicker(
                  context,
                  currentTime: DateTime.parse(dateTimeString),
                  onConfirm: (time) {
                    setState(() {
                      widget.endTime = DateFormat('hh:mm a').format(time);
                    });
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(widget.endTime),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.mainColor,
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            )
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              'NO',
              style: TextStyle(color: AppColor.mainColor),
            )),
        FlatButton(
            onPressed: () {

            },
            child: Text(
              'YES',
              style: TextStyle(color: AppColor.mainColor),
            ))
      ],
    );
  }
}

class CustomChekboxListItem extends StatefulWidget {
  String title;
  String icon;
  bool isSelected;

  CustomChekboxListItem({this.title, this.icon, this.isSelected});

  @override
  _CustomChekboxListItemState createState() => _CustomChekboxListItemState();
}

class _CustomChekboxListItemState extends State<CustomChekboxListItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isSelected,
      onChanged: (value) {
        setState(() {
          widget.isSelected = value;
        });
      },
      title: Text(widget.title),
      secondary: SvgPicture.asset(
        widget.icon,
        width: 30.0,
      ),
    );
  }
}
