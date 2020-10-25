import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/app_management.dart';
import 'package:kid_management/src/ui/location-tracking/location_tracking_screen.dart';
import 'package:kid_management/src/ui/web-filter/web_filter_screen.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<Feature> features = [
    Feature(label: 'Apps Control', icon: 'app.svg', route: AppManagement()),
    Feature(label: 'Web Filter', icon: 'web.svg', route: WebFilterScreen()),
    Feature(label: 'Device Control', icon: 'screen.svg', route: null),
    Feature(label: 'Location', icon: 'location.svg', route: LocationTrackingScreen()),
    Feature(label: 'Report', icon: 'report.svg', route: null),
  ];

  Widget _featureCard(Feature feature, BuildContext context) {
    String baseUrl = 'assets/images/main_dashboard/';
    return InkWell(
      onTap: () {
        if (feature.route != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => feature.route));
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('This feature will be coming soon'),
              title: Text(
                "Woops! We're sorry for this inconvenient",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
      child: Card(
        elevation: 0,
        color: AppColor.grayLight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(baseUrl + feature.icon, width: 50.0),
              SizedBox(
                height: 20.0,
              ),
              Text(
                feature.label.toUpperCase(),
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Welcome, Duy!'.toUpperCase(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  // Image.asset(constant.URL_IMG_KID_SPACE_LOGO, width: 80.0,),
                  Icon(
                    Icons.dashboard,
                    color: AppColor.mainColor,
                    size: 50.0,
                  )
                ],
              ),
            ),
            Flexible(
              child: GridView.count(
                  childAspectRatio: 1.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  children: features.map((feature) {
                    return _featureCard(feature, context);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class Feature {
  String label;
  String icon;
  Widget route;

  Feature({this.label, this.icon, this.route});
}
