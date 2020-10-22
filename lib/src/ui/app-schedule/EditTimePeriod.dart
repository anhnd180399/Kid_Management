import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/models/my_app.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';

class EditTimePriod extends StatefulWidget {
  String startTime;
  String endTime;
  List<MyApp> apps;
  List<MyApp> selectedApps;

  EditTimePriod({this.startTime, this.endTime, this.apps, this.selectedApps});

  @override
  _EditTimePriodState createState() => _EditTimePriodState();
}

class _EditTimePriodState extends State<EditTimePriod> {
  
  bool _isAppSelected(String appName){
    for(int i = 0; i < widget.selectedApps.length; i++){
      var app = widget.selectedApps[i];
      if(app.name == appName){
        return true;
      }
    }
    
    return false;
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GoBackButton(
            color: AppColor.mainColor,
            size: 35.0,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Center(
                child: Text(
              '${widget.startTime} - ${widget.endTime}',
              style: TextStyle(fontSize: 25.0, color: AppColor.mainColor),
            )),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: size.height * 0.6,
              child: ListView.builder(
                itemCount: widget.apps.length,
                itemBuilder: (context, index) {
                  var app = widget.apps[index];
                  return CustomChekboxListItem(
                    isSelected: _isAppSelected(app.name),
                    title: app.name,
                    icon: app.icon,
                  );
                },
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){

                },
                color: AppColor.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}

class CustomChekboxListItem extends StatefulWidget {
  String title;
  String icon;
  bool isSelected;

  CustomChekboxListItem({this.title, this.icon, this.isSelected});

  @override
  _CustomChekboxListItemState createState() => _CustomChekboxListItemState();
}

class _CustomChekboxListItemState extends State<CustomChekboxListItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isSelected,
      onChanged: (value) {
        setState(() {
          widget.isSelected = value;
        });
      },
      title: Text(widget.title),
      secondary: SvgPicture.asset(
        widget.icon,
        width: 30.0,
      ),
    );
  }
}
