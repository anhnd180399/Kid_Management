import 'dart:async';

import 'package:device_apps/device_apps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/char_message_model.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/fake-data/global.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/children_screens/components/app_by_category_page_view.dart';
import 'package:kid_management/src/ui/children_screens/components/app_grid_item.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;
import 'package:kid_management/src/ui/children_screens/components/dot_indicator.dart';

class ChildrenHomeScreen extends StatefulWidget {
  @override
  _ChildrenHomeScreenState createState() => _ChildrenHomeScreenState();
}

class _ChildrenHomeScreenState extends State<ChildrenHomeScreen> {
  // mockup data for testing new app list view
  List<ApplicationSystem> _apps = FakeData.listApplication;
  // list of app categories
  Set<ApplicationCategory> _appCategories = Set();
  // list of categorized apps
  List<List<ApplicationSystem>> _listOfAppsByCategory = [];
  int _currentAppPageViewIndex = 0;
  ApplicationCategory _currentAppCategory;

  static List<ApplicationSystem> _listApplicaionSystem;
  final databaseReference = FirebaseDatabase.instance.reference();
  static refreshData() {
    setState() {
      _listApplicaionSystem = FakeData.listApplicationForKid;
    }
  }

  @override
  void initState() {
    super.initState();
    // _listApplicaionSystem = new List<ApplicationSystem>();
    // firebase
    // try {
    //   databaseReference.child(FakeData.parentName).onValue.listen((event) {
    //     var snapshot = event.snapshot;
    //     var listDisplayApplications =
    //         snapshot.value[CONSTANT.ROOT_APPS] as List;
    //     var listAppName = new List<String>();
    //     listDisplayApplications.forEach((element) {
    //       listAppName.add(element);
    //     });
    //     setState(() {
    //       _listApplicaionSystem = FakeData.convertToListApp(listAppName);
    //     });
    //   });
    // } catch (e) {
    //   _showErrorDialog(e.message);
    // }

    // initialize app categories
    _apps.forEach((app) {
      _appCategories.add(app.application.category);
    });

    // split app list to sub lists by app category
    _appCategories.forEach((category) {
      var appsByCategory =
          _apps.where((a) => a.application.category == category).toList();
      _listOfAppsByCategory.add(appsByCategory);
    });

    _currentAppCategory = _listOfAppsByCategory[0][0].application.category;
  }

  String _toAppCategoryString() {
    if (_currentAppCategory == null) return 'Unknown';
    String categoryString = _currentAppCategory.toString();
    if (categoryString.split('.')[1] == 'undefined') return 'Unknown';

    return categoryString.split('.')[1];
  }

  Future<void> _showErrorDialog(String msg) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/images/kid-screen/kid_home_logo.svg',
            width: 80.0,
          ),
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
              child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentAppPageViewIndex = value;
                _currentAppCategory =
                    _listOfAppsByCategory[_currentAppPageViewIndex][0]
                        .application
                        .category;
              });
            },
            itemBuilder: (context, index) {
              var apps = _listOfAppsByCategory[index];
              var appCategory = apps[0].application.category;
              // page view display list of apps filtered by category
              return AppByCategoryPageView(
                apps: apps,
                appCategory: appCategory,
              );
            },
            itemCount: _listOfAppsByCategory.length,
          )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_listOfAppsByCategory.length, (index) {
                  return DotIndicator(
                    isActive: _currentAppPageViewIndex == index,
                  );
                }),
              )),
          // text to display name of app category
          Text(
            _toAppCategoryString().toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
