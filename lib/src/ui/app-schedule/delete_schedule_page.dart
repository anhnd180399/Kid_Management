import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class DeleteSchedulePage extends StatefulWidget {
  @override
  _DeleteSchedulePageState createState() => _DeleteSchedulePageState();
}

class _DeleteSchedulePageState extends State<DeleteSchedulePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GoBackButton(
            color: AppColor.mainColor,
            size: 35.0,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              child:
                  SvgPicture.asset('assets/images/app-schedule/bg_delete.svg'),
              opacity: 0.3,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text('THIS APP SCHEDULE WILL BE REMOVED'),
            Text('ARE YOU SURE?'),
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: AppColor.mainColor,
                        child: Text(
                          'YES',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xffB03A69),
                          child:
                              Text('NO', style: TextStyle(color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 100.0,)
          ],
        ));
  }
}
