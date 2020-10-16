import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/kid_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Prevent the user from rotating device
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: KidApp(),
      theme: ThemeData(fontFamily: 'Open_Sans'),
    );
  }
}
