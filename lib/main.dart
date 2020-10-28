import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';

import 'src/ui/kid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Prevent the user from rotating device
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(fontFamily: 'Open_Sans'),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new KidApp()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener((){
      setState((){
        print (animation.value.toString());
      });
    });
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        print("Completed!");
        this.dispose();
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
      } else if(status == AnimationStatus.dismissed) {
        animationController.reverse();
      }
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedLogo(
          animation: animation,
        )
    );
  }
}
class AnimatedLogo extends AnimatedWidget {
  final Tween<double> _sizeAnimation = Tween<double> (begin: 0.0, end: 500.0);
  AnimatedLogo({Key key, Animation animation}):super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: _sizeAnimation.evaluate(animation),
      child: KidLogo(),
    );
  }
}
class KidLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconSize = iconTheme.size;
    return AnimatedContainer(
      child: SvgPicture.asset(
              'assets/images/welcome_screen/kidspace_logo_white.svg'
      ),
      width: iconSize,
      height: iconSize,
      duration: Duration(milliseconds: 750),
      curve: Curves.fastOutSlowIn,
    );
  }
}
