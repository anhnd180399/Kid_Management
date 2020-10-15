import 'package:KidSpace_Demo_1/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 35.0,
              color: AppColor.mainColor,
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(
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
    );
  }
}
