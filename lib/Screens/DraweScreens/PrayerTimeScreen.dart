import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:quran/Apis/PrayersTimesApis.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/PrayerTime.dart';
import 'package:quran/Models/PrayerTime/PrayerTimeApiResponse.dart';

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {

  var utils = AppUtils();
  var searchController = TextEditingController();
  var selectedIndex = 2;




  late PrayerTimeApiResponse prayerTimesData;
  List<PrayerTime> prayerTimes = [];
  var todayDetails ;

  DateTime now = DateTime.now();


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()
  async{
    await getPrayers();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greenColor.withOpacity(.1),
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(boxShadow: utils.boxShadow(),color: whiteColor,borderRadius: BorderRadius.circular(7)),
                  child: todayDetails==null?Container(height: 20,):Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(color: whiteColor,boxShadow: utils.boxShadow(),borderRadius: BorderRadius.circular(7)),
                        child: Icon(Icons.my_location),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(todayDetails.meta.timezone,style: utils.subTitleTextStyle(greenDarkColor),),
                            Text(todayDetails.meta.method.name,style: utils.smallTextStyle(greenDarkColor),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(color: whiteColor , borderRadius: BorderRadius.circular(7)),
                        child: Icon(CupertinoIcons.gear_alt,color: greenColor,),
                      )
                    ],
                  ),
                )
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: todayDetails==null?Container(height: 10,):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          now = now.add(Duration(days: -1));
                          findData(now);
                          setState(() {});
                          },
                        child: Icon(CupertinoIcons.left_chevron,color: greenDarkColor,size: 20,)),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(todayDetails.date.readable+" / "+todayDetails.date.hijri.day+" "+todayDetails.date.hijri.month.en+" "+todayDetails.date.hijri.year,style: utils.labelTextStyle(greenDarkColor),),
                      ],
                    )),
                    InkWell(
                        onTap: (){
                          now = now.add(Duration(days: 1));
                          findData(now);
                          setState(() {});
                        },
                        child: Icon(CupertinoIcons.right_chevron,color: greenDarkColor,size: 20,)
                    ),

                  ],
                ),
              ),
              SizedBox(height: 25,),
              Expanded(
                // ignore: unnecessary_null_comparison
                child: prayerTimes==null
                    ?Container(child: Center(child: CupertinoActivityIndicator(),),)
                    :ListView(
                  children: [
                    for(var i = 0;i<prayerTimes.length;i++)
                      InkWell(
                        onTap: (){
                          selectedIndex = i;
                          setState(() {
                          });
                        },
                        child:  listItem(prayerTimes[i],selectedIndex==i?true:false,i==0?true:false,i+1==prayerTimes.length?true:false),
                      ),
                    SizedBox(height: 20,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(flex:2, child:utils.button(greenColor, greenColor, "Add Widget".toUpperCase(), null, whiteColor, (){}),),
                          SizedBox(width: 10,),
                          Expanded(flex:3, child:utils.button(greenColor, greenColor, "Fix Notification Delay".toUpperCase(), null, whiteColor, (){}),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("*Prayer time widget can also added to home search",style: utils.smallTextStyle(greenDarkColor),)
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  listItem(PrayerTime time,isSelected,isFirst,isLast)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: isSelected?0:10),
      decoration: BoxDecoration(
          color: isSelected?greenColor.withOpacity(.7):whiteColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isLast||isSelected?10:0),
              bottomRight: Radius.circular(isLast||isSelected?10:0),
              topLeft: Radius.circular(isFirst||isSelected?10:0),
              topRight: Radius.circular(isFirst||isSelected?10:0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2,child: Text(time.title,style: utils.labelTextStyle(greenDarkColor),)),
          Expanded(flex: 2,child: Text("",style: utils.smallTextStyle(greenDarkColor),)),

          Expanded(flex: 1,child: Text(time.time,style: utils.smallTextStyle(greenDarkColor),)),
          Expanded(flex: 1,child: Icon(CupertinoIcons.bell_fill,color: greenDarkColor,)),
        ],
      ),
    );
  }

  getPrayers() async {
    var apis = PrayerTimeApi();
    Response response = await apis.getPrayerTime({"city":"Lahore","country":"Pakistan","method":"1","month":"05","year":"2021"});
    if(response.statusCode == 200)
    {
      prayerTimesData = PrayerTimeApiResponse.fromJson(jsonDecode(response.body));
      findData(now);
    }
    else
    {
      // utils.showToast("Some error to get data", context);
    }
  }

  findData(date)
  {
    var toDayDate = DateFormat("dd-MM-yyyy").format(date).toString();
    print(toDayDate);
    var res = prayerTimesData.data.where((e) => e.date.gregorian.date==toDayDate);
    if(res.length<1)
      {
        // utils.showToast("Month End", context);
        return;
      }
    todayDetails = res.first;
    var times = todayDetails.timings;
    prayerTimes.clear();
    prayerTimes.add(PrayerTime(title: "Fajar",index: 0,isActive: false,time: times.fajr, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Sunrise",index: 1,isActive: false,time: times.sunrise, endTime: ''));
    prayerTimes.add(PrayerTime(title: "Dhuhr",index: 2,isActive: true,time: times.dhuhr, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Asr",index: 3,isActive: false,time: times.asr, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Sunset",index: 4,isActive: false,time: times.sunset, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Maghrib",index: 5,isActive: false,time: times.maghrib, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Isha",index: 6,isActive: false,time: times.isha, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Imsak",index: 7,isActive: false,time: times.imsak, endTime: ''),);
    prayerTimes.add(PrayerTime(title: "Midnight",index: 8,isActive: false,time: times.midnight, endTime: ''),);
  }
}
