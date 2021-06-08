import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class PrayerNotificationSettings extends StatefulWidget {
  @override
  _PrayerNotificationSettingsState createState() => _PrayerNotificationSettingsState();
}

class _PrayerNotificationSettingsState extends State<PrayerNotificationSettings> {

    var utils = AppUtils();
    var switch1 =true;
    var switch2 =true;
    var switch3 =true;
    var switch4 =false;
    var switch5 =false;
    var switch6 =false;

    @override
    Widget build(BuildContext context) {
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
                      SizedBox(height: 10,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sura-al-kahf",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("10:30 AM Every Friday",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch1, onChanged: (val){
                              switch1 = !switch1;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sura-al-kahf",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("10:30 AM Every Friday",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch2, onChanged: (val){
                              switch2 = !switch2;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Daily Notification",style: utils.labelTextStyle(greenDarkColor),),
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
                                      Text("Prayer Times",style: utils.labelTextStyle(greenColor),),
                                      Text("Fajr,Sunrise,Zohr,Asr,Maghrib,Isha ",style: utils.smallTextStyle(greenColor),),
                                    ],
                                  ),
                                ),
                                Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sura Ya-Seen",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("Never",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch3, onChanged: (val){
                              switch3 = !switch3;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sura Al-Waqia",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("Never",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch4, onChanged: (val){
                              switch4 = !switch4;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sura Al-Mulk",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("Never",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch5, onChanged: (val){
                              switch5 = !switch5;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Recitation Reminder",style: utils.labelTextStyle(greenColor),),
                                SizedBox(height: 5,),
                                Text("Never",style: utils.smallTextStyle(greenColor),),
                              ],
                            )),
                            CupertinoSwitch(value: switch6, onChanged: (val){
                              switch6 = !switch6;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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