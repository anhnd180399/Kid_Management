import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';

class SurfHistoryItem extends StatefulWidget {
  String url;
  String time;
  String date;

  SurfHistoryItem({this.url, this.time, this.date});

  @override
  _SurfHistoryItemState createState() => _SurfHistoryItemState();
}

class _SurfHistoryItemState extends State<SurfHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/report/chrome.svg',
            width: 30.0,
            color: AppColor.mainColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(widget.url),
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.time, style: TextStyle(color: AppColor.grayDark)),
              SizedBox(
                width: 10.0,
              ),
              Text(widget.date, style: TextStyle(color: AppColor.grayDark)),
            ],
          ))
        ],
      ),
    );
  }
}
