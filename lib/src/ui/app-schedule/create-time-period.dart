import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/helpers/datetime_helper.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/time-picker-button.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateTimePeriodScreen extends StatefulWidget {
  String appScheduleName;
  DateTime startTime, endTime;
  List<ApplicationSystem> apps = FakeData.getListNonBlockingApplication();
  List<bool> appChecks = [];

  List<ApplicationSystem> selectedApps = [];

  CreateTimePeriodScreen({this.appScheduleName, this.startTime, this.endTime});

  @override
  _CreateTimePeriodScreenState createState() => _CreateTimePeriodScreenState();
}

class _CreateTimePeriodScreenState extends State<CreateTimePeriodScreen> {
  // bool _connectedToSocket;
  // String _errorConnectMessage;
  @override
  void initState() {
    super.initState();
    widget.apps = FakeData.getListNonBlockingApplication();
    // _connectedToSocket = false;
    // _errorConnectMessage = 'Connecting...';
  }

  Widget _buildStartTimePickerButton() {
    return Container(
      width: 100.0,
      child: RaisedButton(
        elevation: 3,
        color: widget.startTime == null ? Colors.white : AppColor.mainColor,
        onPressed: () {
          DatePicker.showTime12hPicker(
            context,
            currentTime:
                widget.startTime == null ? DateTime.now() : widget.startTime,
            locale: LocaleType.en,
            onConfirm: (time) {
              setState(() {
                widget.startTime = time;
              });
            },
          );
        },
        child: Text(
          widget.startTime == null ? 'FROM' : DateTimeHelper.toTime12Hours(widget.startTime),
          style: TextStyle(
              color:
                  widget.startTime == null ? AppColor.grayDark : Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                style: BorderStyle.solid, color: AppColor.mainColor, width: 2)),
      ),
    );
  }

  Widget _buildEndTimePickerButton() {
    return Container(
      width: 100.0,
      child: RaisedButton(
        elevation: 3,
        color: widget.endTime == null ? Colors.white : AppColor.mainColor,
        onPressed: () {
          DatePicker.showTime12hPicker(
            context,
            currentTime:
                widget.endTime == null ? DateTime.now() : widget.endTime,
            locale: LocaleType.en,
            onConfirm: (time) {
              setState(() {
                widget.endTime = time;
              });
            },
          );
        },
        child: Text(
          DateTimeHelper.toTime12Hours(widget.endTime),
          style: TextStyle(
              color:
                  widget.endTime == null ? AppColor.grayDark : Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                style: BorderStyle.solid, color: AppColor.mainColor, width: 2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.apps.length; i++) {
      widget.appChecks.add(false);
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: size.width,
        child: Column(
          children: <Widget>[
            Text(
              widget.appScheduleName.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TimePickerButton(buttonText: 'FROM'),
                  Container(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  TimePickerButton(buttonText: 'TO'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.apps.length,
                itemBuilder: (context, index) {
                  var app = widget.apps[index];
                  return Row(
                    children: [
                      // SvgPicture.asset(
                      //   Icon(app.iconv2),
                      //   width: 30.0,
                      // ),
                      Image.memory(
                        app.icon,
                        height: 30.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(app.name),
                      Spacer(),
                      Checkbox(
                        value: widget.appChecks[index],
                        onChanged: (value) {
                          setState(() {
                            widget.appChecks[index] = value;
                          });
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  // FakeData.sendFirstSchedule();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: AppColor.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
