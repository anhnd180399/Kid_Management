import 'package:KidSpace_Demo_1/constants/colors.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCheckboxList extends StatefulWidget {
  @override
  _AppCheckboxListState createState() => _AppCheckboxListState();
}

class _AppCheckboxListState extends State<AppCheckboxList> {
  bool showSystemApps = false;
  bool isSelected = false;

  Future<List<Application>> _getApps() async {
    var apps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true, includeSystemApps: showSystemApps);
    return apps;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getApps(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColor.grayLight,
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.mainColor),
            ),
          );
        } else {
          List<Application> apps = snapshot.data;
          if (apps.length > 0) {
            return Container(
              height: 400.0,
              child: Scrollbar(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: apps.length,
                  itemBuilder: (context, index) {
                    Application app = apps[index];

                    return Column(
                      children: [
                        CustomCheckboxListTile(
                          app: app,
                          isSelected: false,
                        ),
                        Divider(
                          color: AppColor.grayLight,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "There's no app installed on your device",
                style: TextStyle(fontSize: 20.0, color: AppColor.grayDark),
              ),
            );
          }
        }
      },
    );
  }
}

class CustomCheckboxListTile extends StatefulWidget {
  ApplicationWithIcon app;
  bool isSelected;

  CustomCheckboxListTile({this.app, this.isSelected});

  @override
  _CustomCheckboxListTileState createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: AppColor.mainColorLight,
        onChanged: (value) {
          setState(() {
            this.widget.isSelected = value;
          });
        },
        title: Text(widget.app.appName),
        value: this.widget.isSelected,
        // app icon
        secondary: widget.app is ApplicationWithIcon
            ? CircleAvatar(
                backgroundImage: MemoryImage(widget.app.icon),
                backgroundColor: Colors.white,
              )
            : null);
  }
}
