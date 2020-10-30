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
  bool _blacklistNotifyOn = false;
  bool _notificationNoneDropDown = false;
  bool _protectedNoneDropDown = false;
  @override
  void initState() {
    super.initState();
    _textEditingController =
        new TextEditingController(text: widget.user.fullName);
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
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.vibration,
                color: AppColor.mainColor,
                size: 30,
              ),
              Text('VIBRATION',
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 80.0)),
              IconButton(
                icon: Icon(
                  !_notificationNoneDropDown ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                  size: 40,
                  color: AppColor.mainColor,
                ),
                onPressed: (){
                  setState(() {
                    _notificationNoneDropDown = !_notificationNoneDropDown;
                  });
                },
              )
            ],
          ),
          Visibility(
            visible: !_notificationNoneDropDown,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('VIBRATE WHEN KID TRY USING blocked APPS',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                    Checkbox(
                      value: _blacklistNotifyOn,
                      onChanged: (value) {
                        setState(() {
                          _blacklistNotifyOn = value;
                        });
                      },
                      activeColor: AppColor.mainColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('VIBRATE WHEN KID TRY browsing BLACKLIST sites',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0)),
                    Checkbox(
                      value: _blacklistNotifyOn,
                      onChanged: (value) {
                        setState(() {
                          _blacklistNotifyOn = value;
                        });
                      },
                      activeColor: AppColor.mainColor,
                    )
                  ],
                ),
              ],
            )
          ),
          Row(
            children: [
              Icon(
                Icons.wifi_protected_setup,
                color: AppColor.mainColor,
                size: 30,
              ),
              Text('ACCESS PROTECTION',
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 43.0)),
              IconButton(
                icon: Icon(
                  !_protectedNoneDropDown ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                  size: 40,
                  color: AppColor.mainColor,
                ),
                onPressed: (){
                  setState(() {
                    _protectedNoneDropDown = !_protectedNoneDropDown;
                  });
                },
              )
            ],
          ),
          Visibility(
            visible: !_protectedNoneDropDown,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('PREVENT FROM UNISTALLING KIDSPACE',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0)),
                    Checkbox(
                      value: _blacklistNotifyOn,
                      onChanged: (value) {
                        setState(() {
                          _blacklistNotifyOn = value;
                        });
                      },
                      activeColor: AppColor.mainColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('ALLOW SHUTTING DOWN DEVICE',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 46.0)),
                    Checkbox(
                      value: _blacklistNotifyOn,
                      onChanged: (value) {
                        setState(() {
                          _blacklistNotifyOn = value;
                        });
                      },
                      activeColor: AppColor.mainColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('BLOCK SETTINGS APP',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0)),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 74.0)),
                    Checkbox(
                      value: _blacklistNotifyOn,
                      onChanged: (value) {
                        setState(() {
                          _blacklistNotifyOn = value;
                        });
                      },
                      activeColor: AppColor.mainColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationAllert() {
    return Row(
      children: [
        Icon(
          Icons.notifications,
          color: AppColor.mainColor,
          size: 30,
        ),
        Text('NOTIFICATION',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 60.0)),
        Switch(
          value: _blacklistNotifyOn,
          onChanged: (value) {
            setState(() {
              _blacklistNotifyOn = value;
            });
          },
          activeColor: AppColor.mainColor,
        )
      ],
    );
  }

  Widget _changePassword() {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(
            Icons.accessible,
            color: AppColor.mainColor,
            size: 30,
          ),
          Text('CHANGE PASSWORD',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
          ),
          Icon(
            Icons.accessible,
            color: AppColor.mainColor,
            size: 30,
          )
        ]));
  }

  Widget _fullNameTextField() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(bottom: 30.0),
        child: Column(
          children: [
            Stack(
              children: [
                TextField(
                    controller: _textEditingController,
                    readOnly: !_editName,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.0,
                              color: AppColor.mainColor)),
                      border: InputBorder.none,
                    )),
                Positioned(
                    top: 10,
                    right: 5,
                    child: !_editName
                        ? IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 25,
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
                            }))
              ],
            ),
            Text(widget.user.email)
          ],
        ));
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
                    _fullNameTextField(),
                    _changePassword(),
                    SizedBox(height: 10),
                    _notificationAllert(),
                    _settings(),
                    _signOutButton()
              ]),
        ),
      ),
    );
  }
}
