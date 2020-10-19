import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/home_v2.dart';
import 'package:kid_management/src/ui/notification/notification.dart';
import 'package:kid_management/src/ui/user-profile/user_profile.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

// Master screen to navigate another screens using bottom nav bar
class _MasterPageState extends State<MasterPage> {
  // List of all main screens to navigate
  List<Widget> _pages = [UserProfileScreen(), Home2(), NotificationScreen()];

  // default selected index: 1, that mean default screen is HomePage()
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // hide label text of bottom nav bar
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.person, size: 35.0, color: AppColor.mainColor),
              icon: Icon(
                Icons.person_outline,
                size: 35.0,
                color: AppColor.mainColor,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35.0,
                color: AppColor.mainColor,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 35.0,
                color: AppColor.mainColor,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none,
                size: 35.0,
                color: AppColor.mainColor,
              ),
              activeIcon: Icon(
                Icons.notifications,
                size: 35.0,
                color: AppColor.mainColor,
              ),
              title: Text(''))
        ],
        // switch selected index
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
