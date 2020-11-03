import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app-schedule/time-picker-button.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class CreateTimePeriodScreen extends StatefulWidget {
  String appScheduleName;
  DateTime startTime, endTime;
  List<ApplicationSystem> apps = FakeData.getListNonBlockingApplication();
  List<bool> appChecks = [];

  CreateTimePeriodScreen({this.appScheduleName, this.startTime, this.endTime});

  @override
  _CreateTimePeriodScreenState createState() => _CreateTimePeriodScreenState();
}

class _CreateTimePeriodScreenState extends State<CreateTimePeriodScreen> {
  @override
  void initState() {
    super.initState();
    widget.apps = FakeData.getListNonBlockingApplication();
    // FakeData.allAppsAsync().then((value) => {
    //       setState(() {
    //         widget.apps = value;
    //       }),
    //     });
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
              widget.appScheduleName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimePickerButton(buttonText: 'FROM'),
                Container(
                  child: Icon(Icons.arrow_forward_ios_outlined),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                TimePickerButton(buttonText: 'TO'),
              ],
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
                onPressed: () {},
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
