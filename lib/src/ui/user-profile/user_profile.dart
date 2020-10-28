import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/models/user_information.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/login.dart';
import 'package:kid_management/src/ui/master_page.dart';

class UserProfileScreen extends StatefulWidget {
  UserInformation user;

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
  UserProfileScreen({this.user});
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _textEditingController;
  bool _editName = false;
  @override
  void initState(){
    super.initState();
    _textEditingController = new TextEditingController(
        text: widget.user.fullName);
  }

  Widget _signOutButton() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
      child: RaisedButton(
        onPressed: () {
          auth.signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        color: AppColor.grayLight,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SIGN OUT',
                style:
                    TextStyle(fontSize: 16.0, color: AppColor.mainColorLight),
              ),
              Icon(
                Icons.logout,
                color: AppColor.mainColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _settings() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: AppColor.grayLight, borderRadius: BorderRadius.circular(10.0)),
      height: 280.0,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _fullNameTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(bottom: 30.0),
      child: Stack(
        children: [
          TextField(
            controller: _textEditingController,
            readOnly: !_editName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: AppColor.mainColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: AppColor.mainColor))),
          ),
          Positioned(
            top: 25,
            right: 0,
            child:
            !_editName ? IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 30,
                  color: AppColor.mainColor,
                ),
                onPressed: () {
                  setState(() {
                    _editName = true;
                  });
                })
            : IconButton(
                icon: Icon(
                  Icons.check,
                  size: 30,
                  color: AppColor.mainColor,
                ),
                onPressed: () {
                  setState(() {
                    _editName = false;
                  });
                })
          ),

        ],
      )

    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: SvgPicture.asset(
                'assets/images/welcome_screen/kidspace_logo_filled.svg',
                width: 80.0,
              ),
            ),
            // Textfield to display user's full name
            // and also let user update full name through this field whenever user tap submit button
            _fullNameTextField(),
            // body of user profile
            _settings(),

            _signOutButton()
          ]),
        ),
      ),
    );
  }
}
