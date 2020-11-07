import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/char_message_model.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/fake-data/global.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/children_screens/components/app_grid_item.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;

class ChildrenHomeScreen extends StatefulWidget {
  @override
  _ChildrenHomeScreenState createState() => _ChildrenHomeScreenState();
}

class _ChildrenHomeScreenState extends State<ChildrenHomeScreen> {
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
    _listApplicaionSystem = new List<ApplicationSystem>();
    // firebase
    try {
      databaseReference.child(FakeData.parentName).onValue.listen((event) {
        var snapshot = event.snapshot;
        var listDisplayApplications =
            snapshot.value[CONSTANT.ROOT_APPS] as List;
        var listAppName = new List<String>();
        listDisplayApplications.forEach((element) {
          listAppName.add(element);
        });
        setState(() {
          _listApplicaionSystem = FakeData.convertToListApp(listAppName);
        });
      });
    } catch (e) {
      _showErrorDialog(e.message);
    }
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
            child: Container(
              margin: EdgeInsets.only(top: 5.0),
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
                children: _listApplicaionSystem.map((app) {
                  return AppGridItem(
                    app: app,
                  );
                })?.toList(),
              ),
            ),
          ),
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
