 import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateAppScheduleStep03 extends StatefulWidget {
  @override
  _CreateAppScheduleStep03State createState() =>
      _CreateAppScheduleStep03State();
}

class _CreateAppScheduleStep03State extends State<CreateAppScheduleStep03> {
  bool isButtonDisabled = false;
  final String BUTTON_TEXT = 'DONE';
  final String APPBAR_TITLE = 'CREATE SCHEDULE';
  final String HEAD_TITLE = 'SET UP SPECIFIC TIME TO USE APPS';
  final String SUB_TITLE = "Now, let's limit a period of time for usage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          APPBAR_TITLE,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 100.0,
            right: 10.0,
            // background svg
            child: Opacity(
              opacity: 0.3,
              child: SvgPicture.asset(
                CONSTANT.URL_IMG_BG_APP_SCHEDULE_STEP03,
                width: 120.0,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // current step text
              Text(
                '3/3',
                style: TextStyle(color: AppColor.mainColor, fontSize: 20.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(HEAD_TITLE,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10.0,
              ),
              Text(SUB_TITLE,
                  style: TextStyle(fontSize: 16.0, color: AppColor.grayDark)),
              SizedBox(
                height: 20.0,
              ),
              TimePeriodPicker(),
              Spacer(),
              // the 'DONE' button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  disabledColor: AppColor.mainColor.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 2.0,
                  onPressed: () {},
                  color: AppColor.mainColor,
                  child: Text(
                    'DONE',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TimePeriodPicker extends StatefulWidget {
  DateTime fromTime;
  DateTime toTime;

  String fromButtonText = 'FROM';
  String toButtonText = 'TO';

  @override
  _TimePeriodPickerState createState() => _TimePeriodPickerState();
}

class _TimePeriodPickerState extends State<TimePeriodPicker> {
  Widget _startTimePickerButton() {
    return Container(
      width: 150.0,
      child: RaisedButton(
        elevation: 3,
        color: widget.fromTime == null ? Colors.white : AppColor.mainColor,
        onPressed: () {
          DatePicker.showTime12hPicker(
            context,
            currentTime:
                widget.fromTime == null ? DateTime.now() : widget.fromTime,
            locale: LocaleType.en,
            onConfirm: (time) {
              setState(() {
                widget.fromTime = time;
                String time12Hours =
                    DateFormat('hh:mm a').format(widget.fromTime);
                widget.fromButtonText = time12Hours;
              });
            },
          );
        },
        child: Text(
          widget.fromButtonText,
          style: TextStyle(
              color:
                  widget.fromTime == null ? AppColor.grayDark : Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                style: BorderStyle.solid, color: AppColor.mainColor, width: 2)),
      ),
    );
  }

  Widget _endTimePickerButton() {
    return Container(
      width: 150.0,
      child: RaisedButton(
        elevation: 3,
        color: widget.toTime == null ? Colors.white : AppColor.mainColor,
        onPressed: () {
          if (widget.fromTime != null) {
            DatePicker.showTime12hPicker(
              context,
              currentTime:
                  widget.toTime == null ? DateTime.now() : widget.toTime,
              locale: LocaleType.en,
              onConfirm: (time) {
                Duration duration = widget.fromTime.difference(time);
                int diffTimeInSeconds = duration.inSeconds * -1;
                if (diffTimeInSeconds > 0) {
                  setState(() {
                    widget.toTime = time;
                    String time12Hours =
                        DateFormat('hh:mm a').format(widget.toTime);
                    widget.toButtonText = time12Hours;
                  });
                } else {
                  Fluttertoast.showToast(
                      msg: 'Woops! End time must be greater than Start time',
                      gravity: ToastGravity.CENTER,
                      backgroundColor: AppColor.grayDark,
                      textColor: Colors.white);
                }
              },
            );
          } else {
            Fluttertoast.showToast(
                msg: 'Oh no, you forgot choosing start time first',
                gravity: ToastGravity.CENTER,
                backgroundColor: AppColor.grayDark,
                textColor: Colors.white);
          }
        },
        child: Text(
          widget.toButtonText,
          style: TextStyle(
              color: widget.toTime == null ? AppColor.grayDark : Colors.white),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _startTimePickerButton(),
        Icon(Icons.keyboard_arrow_right),
        _endTimePickerButton()
      ],
    );
  }
}
