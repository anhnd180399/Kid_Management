import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/login.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/resources/constant.dart' as CONSTANT;
import 'kid_app.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Name"),
        _entryField("Email"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

    Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 56.0,
            child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                obscureText: isPassword,
                decoration: InputDecoration(
                    hintText: title,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide:
                        BorderSide(width: 0, style: BorderStyle.none)),
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Column(children: <Widget>[
      Image.asset(
        CONSTANT.URL_IMG_USER_AVATAR,
        width: 126.0,
        height: 126.0,
      ),
      SizedBox(height: 20),
//      Text(
//        'Create Account',
//        style: TextStyle(
//          fontFamily: 'Segoe UI',
//          fontSize: 36,
//          color: const Color(0xff333232),
//          fontWeight: FontWeight.w700,
//        ),
//        textAlign: TextAlign.left,
//      ),
//      Text(
//        'Create a new account',
//        style: TextStyle(
//          fontFamily: 'Segoe UI',
//          fontSize: 20,
//          color: const Color(0xff888686),
//        ),
//        textAlign: TextAlign.left,
//      )
    ]);
  }

  Widget _signUpButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [HexColor("#3AB081"), HexColor("#349B72")])),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _signInLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account?',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff3dac43),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
      ),
      body: new Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _title(),
                    SizedBox(height: 20),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _signUpButton(),
                    _signInLabel(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
