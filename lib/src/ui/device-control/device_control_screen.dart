import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/ui/device-control/bandwidth_control_screen.dart';
import 'package:kid_management/src/ui/device-control/brightness_control_screen.dart';
import 'package:kid_management/src/ui/device-control/screen_locking_screen.dart';

class DeviceControlScreen extends StatefulWidget {
  @override
  _DeviceControlScreenState createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    BrightnessControlScreen(),
    BandwidthControlScreen(),
    ScreenLockingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'DEVICE CONTROL',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
      ),
      body: Container(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColor.mainColor.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0, -3.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            child: BottomNavigationBar(
              iconSize: 40.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              onTap: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              currentIndex: _selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.brightness_7,
                      color: AppColor.grayDark,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.brightness_7,
                      color: AppColor.mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.speed,
                      color: AppColor.grayDark,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.speed,
                      color: AppColor.mainColor,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.screen_lock_portrait,
                      color: AppColor.grayDark,
                    ),
                    label: '',
                    activeIcon: Icon(
                      Icons.screen_lock_portrait,
                      color: AppColor.mainColor,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
