import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/ui/common-ui/custom_switch.dart';

class AppBlocking extends StatefulWidget {
  @override
  _AppBlockingState createState() => _AppBlockingState();
}

class _AppBlockingState extends State<AppBlocking> {
  var _apps = FakeData.getListAllApplication();
  bool _blockingModeIsOn = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'app blocking'.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          CustomSwitch(
            value: _blockingModeIsOn,
            onChanged: (value) {
              setState(() {
                _blockingModeIsOn = value;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: size.width,
        child: Column(
          mainAxisAlignment: !_blockingModeIsOn
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Lock & Unlock Apps'.toUpperCase(),
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                ),
              ),
              visible: _blockingModeIsOn,
            ),
            Visibility(
              visible: !_blockingModeIsOn,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: SvgPicture.asset(
                      'assets/images/app-blocking/shield.svg',
                      width: 100.0,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                      width: size.width * 0.8,
                      child: Text(
                        'Now you can block or unblock some apps in your kid\'s device!',
                        style: TextStyle(color: AppColor.grayDark),
                        textAlign: TextAlign.center,
                      )),
                  Visibility(
                    child: Text('Tap switch to turn on blocking mode'),
                    visible: !_blockingModeIsOn,
                  )
                ],
              ),
            ),
            // the list of apps
            Visibility(
              visible: _blockingModeIsOn,
              child: Expanded(
                  child: ListView.builder(
                itemCount: _apps.length,
                itemBuilder: (context, index) {
                  var app = _apps[index];
                  return AppBlockListItem(
                    app: app,
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}

class AppBlockListItem extends StatefulWidget {
  ApplicationSystem app;

  AppBlockListItem({this.app});

  @override
  _AppBlockListItemState createState() => _AppBlockListItemState();
}

class _AppBlockListItemState extends State<AppBlockListItem> {
  bool _isBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          // icon of app
          Image.memory(
            widget.app.icon,
            height: 30.0,
          ),
          Spacer(),
          // app name
          Text(
            widget.app.name,
            style: TextStyle(fontSize: 16.0),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.mainColor, width: 2.0),
                borderRadius: BorderRadius.circular(50.0)),
            child: IconButton(
                icon: Icon(
                  widget.app.isBlock ? Icons.lock : Icons.lock_open,
                  color: AppColor.mainColor,
                ),
                onPressed: () {
                  setState(() {
                    FakeData.setApplicationStatus(
                        widget.app, !widget.app.isBlock);
                    // widget.app.isBlock = !widget.app.isBlock;
                  });
                }),
          )
        ],
      ),
    );
  }
}
