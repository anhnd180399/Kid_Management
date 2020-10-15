import 'package:flutter/material.dart';
import 'ui/kid_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KidApp(),
      theme: ThemeData(fontFamily: 'Open_Sans'),
    );
  }
}
