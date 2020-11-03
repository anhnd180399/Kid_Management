import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';

class MyApp {
  String name;
  Uint8List icon;
  ApplicationWithIcon application;
  bool isBlock;

  MyApp({this.name, this.icon, this.application, this.isBlock});

  MyApp.toApplication(ApplicationWithIcon application) {
    name = application.appName;
    this.icon = application.icon;
    this.application = application;
    this.isBlock = false;
  }
}
