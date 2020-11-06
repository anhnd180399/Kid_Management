import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/char_message_model.dart';
import 'package:kid_management/src/fake-data/global.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/children_screens/children_app_schedule_screen.dart';
import 'package:kid_management/src/ui/children_screens/children_home_screen.dart';
import 'package:kid_management/src/ui/children_screens/parents_mode_screen.dart';

class ChildrenScreen extends StatefulWidget {
  @override
  _ChildrenScreenState createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {
  int _currentPageIndex = 0;
  List<Widget> _pages = [
    ChildrenHomeScreen(),
    ChildrenAppScheduleScreen(),
    ParentsModeScreen()
  ];
  bool _connectedToSocket;
  String _errorConnectMessage;
  UserSocket _kidUser;
  UserSocket _parentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init childrent user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {},
          child: Container(
            child: _pages[_currentPageIndex],
          ),
        ),
      ),
      // Bottom nav bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.mainColor.withOpacity(0.15),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Opacity(
                  opacity: _currentPageIndex == 0 ? 1 : 0.4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentPageIndex = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/kid-screen/duck.svg',
                      width: 40.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: _currentPageIndex == 1 ? 1 : 0.4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentPageIndex = 1;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/kid-screen/calendar.svg',
                      width: 40.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: _currentPageIndex == 2 ? 1 : 0.4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentPageIndex = 2;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/kid-screen/family.svg',
                      width: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
