
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/create-app-schedule-step01.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;

class AppSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GoBackButton(
            color: AppColor.mainColor,
            size: 35.0,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'YOUR APP SCHEDULE',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  'Build your schedule to use apps',
                  style: TextStyle(
                      fontSize: 16.0, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Center(
                child: SvgPicture.asset(
                  CONSTANT.URL_IMG_BG_APP_SCHEDULE_EMPTY,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  "There's no app schedule",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 14.0),
                ),
              ),
              Center(
                child: Text("Tap Plus Icon to add new one",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3), fontSize: 14.0)),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateAppScheduleStep01()));
          },
          child: Icon(Icons.add),
          backgroundColor: AppColor.mainColor,
        ));
  }
}
