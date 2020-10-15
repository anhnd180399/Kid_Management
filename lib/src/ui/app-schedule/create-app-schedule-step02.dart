import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/app-checkbox-list.dart';
import 'package:kid_management/src/ui/app-schedule/create-app-schedule-step03.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateAppScheduleStep02 extends StatefulWidget {
  @override
  _CreateAppScheduleStep02State createState() =>
      _CreateAppScheduleStep02State();
}

class _CreateAppScheduleStep02State extends State<CreateAppScheduleStep02> {
  final String BUTTON_TEXT = 'NEXT';
  final String APPBAR_TITLE = 'CREATE SCHEDULE';
  final String HEAD_TITLE = 'CHOOSE APPS YOU WANT TO SETUP';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            // current step text
            Column(
              children: [
                Text(
                  '2/3',
                  style: TextStyle(color: AppColor.mainColor, fontSize: 20.0),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(HEAD_TITLE, style: TextStyle(fontSize: 18.0)),
                SizedBox(
                  height: 40.0,
                )
              ],
            ),
            // the list of installed apps
            AppCheckboxList(),
            SizedBox(
              height: 50.0,
            ),
            // The 'NEXT' button
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                elevation: 2.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAppScheduleStep03(),
                      ));
                },
                color: AppColor.mainColor,
                child: Text(
                  BUTTON_TEXT,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
