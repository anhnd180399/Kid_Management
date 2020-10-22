import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_management/src/fake-data/fake_data.dart';
import 'package:kid_management/src/models/address_history.dart';
import 'package:kid_management/src/models/location_history.dart';
import 'package:kid_management/src/resources/colors.dart';
import 'package:kid_management/src/ui/common-ui/back-button.dart';
import 'package:kid_management/src/ui/location-tracking/address_history_card.dart';
import 'package:kid_management/src/ui/location-tracking/location_history_item.dart';
import 'package:kid_management/src/ui/location-tracking/location_history_list.dart';

class LocationTrackingScreen extends StatefulWidget {
  List<LocationHistory> recentLocationHistories;

  @override
  _LocationTrackingScreenState createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
  bool _searchBarIsShow = false;

  @override
  Widget build(BuildContext context) {
    widget.recentLocationHistories = FakeData.recentLocationHistories();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GoBackButton(
          color: AppColor.mainColor,
          size: 35.0,
        ),
        centerTitle: true,
        title: Text(
          'LOCATION TRACKING',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SvgPicture.asset(
                  'assets/images/location-tracking/bg_location.svg'),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  !_searchBarIsShow
                      ? Text(
                          'LOCATION HISTORY',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.grayLight,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Search location history',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                  Visibility(
                    child: Spacer(),
                    visible: !_searchBarIsShow,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: AppColor.mainColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _searchBarIsShow = !_searchBarIsShow;
                        });
                      }),
                  // filter button
                  FilterPopupButton()
                ],
              ),
              LocationHistoryList(
                locationHistories: widget.recentLocationHistories,
                headTitle: 'RECENT DAYS',
              ),
              LocationHistoryList(
                locationHistories: widget.recentLocationHistories,
                headTitle: 'PREVIOUS DAYS',
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                width: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  elevation: 0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'CLEAR HISTORY',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterPopupButton extends StatefulWidget {


  @override
  _FilterPopupButtonState createState() => _FilterPopupButtonState();
}

class _FilterPopupButtonState extends State<FilterPopupButton> {

  bool _filterDaysActive = true;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onCanceled: () {
        print('cancel');
      },
      child: Icon(
        Icons.filter_alt_rounded,
        color: AppColor.mainColor,
      ),
      onSelected: (value) {

      },
      initialValue: 1,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: RadioListTile(
            title: Text('Days'),
            activeColor: AppColor.mainColor,
            value: 1,
          )),
          PopupMenuItem(
              child: RadioListTile(
                title: Text('Weeks'),
                value: 2,
              )),

        ];
      },
    );
  }
}
