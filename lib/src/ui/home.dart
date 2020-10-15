import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;
import 'package:kid_management/src/ui/app-schedule/app-schedule.dart';
import 'package:kid_management/src/ui/common-ui/bottom-navigation-bar.dart';

class HomePage extends StatelessWidget {
  final String APP_CONTROL = "Apps Control";
  final String WEB_FILTER = "Web Filter";
  final String SCREEN_BLOCKING = "Screen Blocking";
  final String LOCATION_TRACKING = "Location Tracking";
  final String SCHEDULE = "Schedule";
  final String ACTIVITY_REPORT = "Activity Report";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _title(),
                Container(
                  height: 350,
                  child: GridView.count(
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      children: [
                        _appList(APP_CONTROL, CONSTANT.URL_IMG_APP_CONTROL,
                            AppSchedule(), context),
                        _appList(WEB_FILTER, CONSTANT.URL_IMG_WEB_FILTER, null,
                            context),
                        _appList(SCREEN_BLOCKING,
                            CONSTANT.URL_IMG_SCREEN_BLOCKING, null, context),
                        _appList(LOCATION_TRACKING,
                            CONSTANT.URL_IMG_LOCATION_TRACKING, null, context),
                        _appList(
                            SCHEDULE, CONSTANT.URL_IMG_SCHEDULE, null, context),
                        _appList(ACTIVITY_REPORT,
                            CONSTANT.URL_IMG_ACTIVITY_REPORT, null, context)
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _title() {
    return Column(
      children: <Widget>[
        Image.asset(
          CONSTANT.URL_IMG_KID_SPACE_LOGO,
          width: 150,
          height: 200,
        ),
      ],
    );
  }

  Widget _appList(
      String title, String img, Widget screen, BuildContext context) {
    return Container(
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0,
          onPressed: () {
            // display the snack bar if screen is null
            if (screen == null) {
              print('Coming soon!');
            } else {
              // route to given screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screen,
                  ));
            }
          },
          color: AppColor.grayLight,
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  img,
                  width: 80.0,
                  height: 80.0,
                ),
                SizedBox(height: 30),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                )
              ],
            ),
          )),
    );
  }
}
