import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:kid_management/src/models/my_app.dart';

class AppGridItem extends StatefulWidget {
  MyApp app;

  AppGridItem({this.app});

  @override
  _AppGridItemState createState() => _AppGridItemState();
}

class _AppGridItemState extends State<AppGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // open the app when user taps on app icon
        DeviceApps.openApp(widget.app.application.packageName);
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              child: Image(image: MemoryImage(widget.app.icon)),
              width: 50,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              widget.app.name,
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
