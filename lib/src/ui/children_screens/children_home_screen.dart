import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/children_screens/components/app_grid_item.dart';

class ChildrenHomeScreen extends StatefulWidget {
  @override
  _ChildrenHomeScreenState createState() => _ChildrenHomeScreenState();
}

class _ChildrenHomeScreenState extends State<ChildrenHomeScreen> {
// Fake app data
  // List<MyApp> _apps = FakeData.listApplication;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FakeData.init();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset('assets/images/kid-screen/kid_home_logo.svg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'hello! i am kidspace'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 3.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Play around with your phone',
            style: TextStyle(color: AppColor.grayDark, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),

          // Grid view to show all apps
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(10),
                  borderRadius: BorderRadius.circular(10.0)),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: FakeData.listApplication.map((app) {
                  return AppGridItem(app: app,);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
