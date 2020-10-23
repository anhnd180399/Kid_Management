import 'package:flutter/material.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/notification_model.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/notification/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var _notifications = FakeData.notifications();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'notifications'.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // button to clear all notifications
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'clear all'.toUpperCase(),
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          Icon(
                            Icons.delete,
                            color: AppColor.mainColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // notification cards
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: _notifications
                        .map((notification) => NotificationCard(
                              notificationModel: notification,
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
