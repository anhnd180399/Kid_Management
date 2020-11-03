import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/ui/children_screens/children_screen.dart';
import 'package:kid_management/src/ui/splash_screen.dart';

import 'src/ui/kid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FakeData.init();
    // Prevent the user from rotating device
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeAnimation(),
      theme: ThemeData(fontFamily: 'Open_Sans'),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new KidApp()
      },
    );
  }
}

class WelcomeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      height: MediaQuery.of(context).size.height,
    );
  }
}
