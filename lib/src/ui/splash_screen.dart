import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/UserSocket.dart';
import 'package:kid_management/src/fake-data/global.dart';
import 'package:kid_management/src/ui/kid-screens/kid_control.dart';
import 'package:kid_management/src/ui/children_screens/children_screen.dart';
import 'package:kid_management/src/ui/kid_app.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  double height;

  SplashScreen({this.height});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _backgroundAnim;
  Animation<double> _logoAnim;
  Animation<double> _appNameAnim;
  Animation<double> _progressBarAnim;
  // bool _connectedToSocket;
  // String _errorConnectMessage;
  Color _mainColor = Color(0xff3ab081);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller to control all animations
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _backgroundAnim = Tween<double>(begin: 0, end: widget.height).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.3, curve: Curves.linearToEaseOut)));

    _logoAnim = Tween<double>(begin: 0.1, end: 0.3).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 0.5, curve: Curves.easeIn)));

    _appNameAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 0.7, curve: Curves.easeInOut)));

    _progressBarAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.7, 1, curve: Curves.easeIn)));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChildrenScreen(),
            ));
      }
    });

    _animationController.forward();
  }

  UserSocket _kidUser;
  UserSocket _parentUser;

  // _connectKidSocket() {
  //   Future.delayed(Duration(seconds: 2), () async {
  //     print("Connecting to socket server");
  //     Global.initKidSocket();

  //     await Global.socketUtilKid.initSocket(_kidUser);
  //     Global.socketUtilKid.connectToSocket();
  //     Global.socketUtilKid.setConnectListener(onConnect);
  //     Global.socketUtilKid.setOnDisconnectListener(onDisconnect);
  //     Global.socketUtilKid.setOnErrorListener(onError);
  //     Global.socketUtilKid.setOnConnectionErrorListener(onConnectError);
  //   });
  // }

  // _connectParentSocket() {
  //   Future.delayed(Duration(seconds: 2), () async {
  //     print("Connecting to socket server");
  //     Global.initParentSocket();
  //     await Global.socketUtilParent.initSocket(_parentUser);
  //     Global.socketUtilParent.connectToSocket();
  //     Global.socketUtilParent.setConnectListener(onConnect);
  //     Global.socketUtilParent.setOnDisconnectListener(onDisconnect);
  //     Global.socketUtilParent.setOnErrorListener(onError);
  //     Global.socketUtilParent.setOnConnectionErrorListener(onConnectError);
  //   });
  // }

  // onConnect(data) {
  //   print('Connected $data');
  //   setState(() {
  //     _connectedToSocket = true;
  //   });
  // }

  // onConnectError(data) {
  //   print('onConnectError $data');
  //   setState(() {
  //     _connectedToSocket = false;
  //     _errorConnectMessage = 'Failed to Connect';
  //   });
  // }

  // onConnectTimeout(data) {
  //   print('onConnectTimeout $data');
  //   setState(() {
  //     _connectedToSocket = false;
  //     _errorConnectMessage = 'Connection timedout';
  //   });
  // }

  // onError(data) {
  //   print('onError $data');
  //   setState(() {
  //     _connectedToSocket = false;
  //     _errorConnectMessage = 'Connection Failed';
  //   });
  // }

  // onDisconnect(data) {
  //   print('onDisconnect $data');
  //   setState(() {
  //     _connectedToSocket = false;
  //     _errorConnectMessage = 'Disconnected';
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _backgroundAnim,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                width: size.width,
                height: _backgroundAnim.value,
                color: _mainColor,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: size.height * _logoAnim.value,
                child: SvgPicture.asset('assets/images/splash_screen/icon.svg'),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.57,
                child: Opacity(
                  opacity: _appNameAnim.value,
                  child: Text(
                    'kidspace'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                child: Opacity(
                  opacity: _progressBarAnim.value,
                  child: LinearPercentIndicator(
                    percent: _progressBarAnim.value,
                    backgroundColor: Colors.white,
                    progressColor: Colors.amberAccent,
                    lineHeight: 20,
                    width: size.width * 0.5,
                    alignment: MainAxisAlignment.center,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    animateFromLastPercent: true,
                  ),
                ),
                left: 0,
                right: 0,
                top: size.height * 0.8,
              )
            ],
          );
        },
      ),
    );
  }
}
