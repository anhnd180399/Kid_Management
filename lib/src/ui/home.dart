import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;
final String APP_CONTROL = "App control";
final String WEB_FILTER = "Web Filter";
final String SCREEN_BLOCKING = "Screen Blocking";
final String LOCATION_TRACKING = "Location Tracking";
final String SCHEDULE = "Schedule";
final String ACTIVITY_REPORT = "Activity Report";

Widget _title() {
  return Column(
    children: <Widget>[
      Image.asset(
        CONSTANT.URL_IMG_KID_SPACE_LOGO,
        width: 150,
        height: 150,
      ),
    ],
  );
}

Widget _appList(String title, String img) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: Colors.grey.withOpacity(0.5), width: 3.0),
    ),
    child: RaisedButton(
        onPressed: () {
          //TODO ADD EVENT
        },
        color: Colors.white.withOpacity(0.95),
        child: Column(
          children: [
            Image.asset(
              img,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
              ),
            )
          ],
        )),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  _title(),
                  Container(
                    height: 350,
                    child: GridView.count(
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 2,
                        children: [
                          _appList(APP_CONTROL, CONSTANT.URL_IMG_APP_CONTROL),
                          _appList(WEB_FILTER, CONSTANT.URL_IMG_WEB_FILTER),
                          _appList(SCREEN_BLOCKING, CONSTANT.URL_IMG_SCREEN_BLOCKING),
                          _appList(LOCATION_TRACKING, CONSTANT.URL_IMG_LOCATION_TRACKING),
                          _appList(SCHEDULE, CONSTANT.URL_IMG_SCHEDULE),
                          _appList(ACTIVITY_REPORT, CONSTANT.URL_IMG_ACTIVITY_REPORT)
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
