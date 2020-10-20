import 'package:flutter/material.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            // title
            Center(
              child: Text(
                "Don't worry!",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Center(
                child: Text(
                    "We'll help you reset password in just a simple step",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: AppColor.grayDark)),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: AppColor.grayLight,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'YOUR EMAIL'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                color: AppColor.mainColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {},
                child: Text('get pin code'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
