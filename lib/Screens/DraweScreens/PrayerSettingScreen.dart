
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:geocoder/geocoder.dart';
//import 'package:geolocator/geolocator.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:hijri/hijri_calendar.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class PrayerSettingScreen extends StatefulWidget {
  @override
  _PrayerSettingScreenState createState() => _PrayerSettingScreenState();
}

class _PrayerSettingScreenState extends State<PrayerSettingScreen> {

  var utils = AppUtils();
  var advanceSetting =false;

  var mSelectedAddress="";
  var mSelectedAddressLat=0.0;
  var mSelectedAddressLong=0.0;


  @override
  void initState() {
    super.initState();
    //getLocation();
  }




/*   getLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var coordinates = Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("$addresses : ${first.addressLine}");
    setState(() {
      mSelectedAddressLat = coordinates.latitude;
      mSelectedAddressLong = coordinates.longitude;
      mSelectedAddress = first.addressLine;
    });
  } */

  @override
  Widget build(BuildContext context) {

   // var _today = new HijriCalendar.now();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: greenColor.withOpacity(.1),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: utils.boxShadow(),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Current Location",style: utils.labelTextStyle(greenColor),),
                                    SizedBox(height: 5,),
                                    Text(mSelectedAddress,style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(height: 2,),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hijiri Date Adjustment",style: utils.labelTextStyle(greenColor),),
                                    SizedBox(height: 5,),
                                   // Text(_today.toFormat("dd  MMMM  yyyy").toString(),style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: utils.boxShadow(),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Expanded(child: Text("Hijiri Date Adjustment",style: utils.labelTextStyle(greenColor),)),
                          CupertinoSwitch(value: advanceSetting, onChanged: (val){
                            advanceSetting =! advanceSetting;
                            setState((){});
                          })
                        ],
                      ),
                    ),
                    !advanceSetting?Container():Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("Advanced Settings",style: utils.labelTextStyle(greenDarkColor),),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              boxShadow: utils.boxShadow(),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Timezone Adjustment",style: utils.labelTextStyle(greenColor),),
                                        SizedBox(height: 5,),
                                        Text("none",style: utils.smallTextStyle(greenColor),),
                                      ],
                                    ),
                                  ),
                                  Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Fajr/Isha Method auto",style: utils.labelTextStyle(greenColor),),
                                        SizedBox(height: 5,),
                                        Text("auto",style: utils.smallTextStyle(greenColor),),
                                      ],
                                    ),
                                  ),
                                  Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Asr Method auto",style: utils.labelTextStyle(greenColor),),
                                        SizedBox(height: 5,),
                                        Text("auto",style: utils.smallTextStyle(greenColor),),
                                      ],
                                    ),
                                  ),
                                  Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("High Latitude Method",style: utils.labelTextStyle(greenColor),),
                                        SizedBox(height: 5,),
                                        Text("auto",style: utils.smallTextStyle(greenColor),),
                                      ],
                                    ),
                                  ),
                                  Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
