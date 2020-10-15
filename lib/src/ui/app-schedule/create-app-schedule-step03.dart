
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/create-app-schedule-step02.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateAppScheduleStep03 extends StatefulWidget {
  @override
  _CreateAppScheduleStep03State createState() =>
      _CreateAppScheduleStep03State();
}

class _CreateAppScheduleStep03State extends State<CreateAppScheduleStep03> {
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'CREATE SCHEDULE',
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
        child: Column(
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
            // background svg
            Stack(
              children: [
                Positioned(
                  child: Opacity(
                    opacity: 0.3,
                    child: SvgPicture.asset(
                      'assets/app-schedule/bg-create-schedule-3.svg',
                      width: 150.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("I WANT MY KID TO USE APPS",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.0,
            ),
            Text("This will help you easily remember",
                style: TextStyle(fontSize: 16.0, color: AppColor.grayDark)),
            SizedBox(
              height: 20.0,
            ),

            Spacer(),
            // the 'NEXT' button
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                disabledColor: AppColor.mainColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                elevation: 2.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAppScheduleStep02(),
                      ));
                },
                color: AppColor.mainColor,
                child: Text(
                  'DONE',
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
