import 'package:flutter/material.dart';

class ScreenLockingScreen extends StatefulWidget {
  @override
  _ScreenLockingScreenState createState() => _ScreenLockingScreenState();
}

class _ScreenLockingScreenState extends State<ScreenLockingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Screen Blocking'),
      ),
    );
  }
}
