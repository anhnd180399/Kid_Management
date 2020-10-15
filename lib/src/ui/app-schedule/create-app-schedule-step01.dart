
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/create-app-schedule-step02.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateAppScheduleStep01 extends StatefulWidget {
  @override
  _CreateAppScheduleStep01State createState() =>
      _CreateAppScheduleStep01State();
}

class _CreateAppScheduleStep01State extends State<CreateAppScheduleStep01> {
  bool isButtonDisabled = true;

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
              '1/3',
              style: TextStyle(color: AppColor.mainColor, fontSize: 20.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            // background svg
            Opacity(
              opacity: 0.3,
              child: SvgPicture.asset(
                'assets/app-schedule/bg-create-schedule-1.svg',
                width: 150.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Name your schedule",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.0,
            ),
            Text("This will help you easily remember",
                style: TextStyle(fontSize: 16.0, color: AppColor.grayDark)),
            SizedBox(
              height: 20.0,
            ),
            // text field to input schedule's name
            TextField(
              onChanged: (value) {
                setState(() {
                  if (value.length == 0) {
                    this.isButtonDisabled = true;
                  } else {
                    this.isButtonDisabled = false;
                  }
                });
              },
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(fontSize: 26.0),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (value.length > 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAppScheduleStep02(),
                      ));
                }
              },
              autofocus: true,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  hintText: "SCHEDULE'S NAME",
                  hintStyle: TextStyle(fontSize: 18.0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.mainColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.mainColor, width: 2.0))),
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
                onPressed: this.isButtonDisabled
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAppScheduleStep02(),
                            ));
                      },
                color: AppColor.mainColor,
                child: Text(
                  'NEXT',
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