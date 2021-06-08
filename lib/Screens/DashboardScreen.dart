import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:quran/Apis/MainScreenApis.dart';
import 'package:quran/Apis/PrayersTimesApis.dart';
import 'package:quran/Apis/QuranApis.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppConstants/AppData/AppData.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/MainAyahListApiResponse.dart';
import 'package:quran/Models/PrayerTime/CurrentDatePrayerTimeApiResponse.dart';
import 'package:quran/Models/QuranModels/LanguagesListApiResponse.dart';
import 'package:quran/Models/QuranModels/RandomAyahApiResponse.dart';
import 'package:quran/Models/QuranModels/RecitationsListApiResponse.dart';
import 'package:quran/Models/QuranModels/TafsirListApiResponse.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'Components/LanguageWidget.dart';
import 'Components/RecitationsWidget.dart';
import 'Components/TafsirWidget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  var utils = AppUtils();
  var showImageSwitch =false;

  var _today = new HijriCalendar.now();

  final _storage = FlutterSecureStorage();
  var activeFontIndex = activeFont;


  // RecitationsListApiResponse reciter ;
  // LanguagesListApiResponse languages;
  // TafsirListApiResponse tafsirs;
  // CurrentDatePrayerTimeApiResponse prayerTime;
  // RandomAyahApiResponse randomAyah;
  // MainAyahListApiResponse dataList;

  var reciter ;
  var languages;
  var tafsirs;
  var prayerTime;
  var randomAyah;
  var dataList;


  @override
  void initState() {
    // TODO: implement initState
    getData();
  }
  getData() async {

    // await getRandomAyah();
    // setState(() {});
    await getPrayerTime();
    setState(() {});
    await getAyahList();
    setState(() {});
    await getReciterList();
    setState(() {});
    await getLanguageList();
    setState(() {});
    await getTafsirList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greenColor.withOpacity(.1),
          child: Column(
            children: [
              Container(
                height: 180,
                child: Stack(
                  clipBehavior: Clip.none, children: [
                    Container(
                      height: double.infinity,
                        width: double.infinity,
                        child: Image.asset("assets/images/dashboardImage.png",fit: BoxFit.cover,)
                    ),
                    Container(
                      color: greenColor.withOpacity(.7),
                      height: double.infinity,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: double.infinity,
                        child: prayerTime==null? Container():Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Iftar start in 16min 60s",style: utils.smallTextStyle(whiteColor),),
                            SizedBox(height: 7,),
                            Text("Maghrib",style: utils.titleTextStyle(whiteColor),),
                            SizedBox(height: 3,),
                            Text(prayerTime.data.timings.maghrib,style: utils.labelTextStyle(whiteColor),),
                            SizedBox(height: 5,),
                            Text("Asr ends in ",style: utils.titleTextStyle(whiteColor),),
                            SizedBox(height:2,),
                            Text("16min 60s",style: utils.smallTextStyle(whiteColor),),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: -30,
                      child: Wrap(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),//"1 Ramadan 1442 AH"
                                    child: Center(child: Text(_today.toFormat("dd  MMMM  yyyy").toString(),style: utils.labelTextStyle(greenColor),),),
                                  ),
                                ),
                                Container(width: 1,height:50,color: greenColor,child: Container(),),
                                Expanded(
                                  child: Container(
                                    child: Center(child: Text(formattedDate.toString(),style: utils.labelTextStyle(greenColor)),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Wrap(
                        children: [
                          for(var item in homeOptions)
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>item.screen),
                                );
                              },
                              child: utils.dashboardCategoryItem(item.image, item.title, whiteColor),
                            )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Quran Engagement Time",style: utils.titleTextStyle(greenColor),)),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Text("Your this week",style: utils.labelTextStyle(greenColor),),
                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 110,
                                    width: 110,
                                    child:Container(
                                        height: 200,
                                        child: SfRadialGauge(
                                          axes: <RadialAxis>[
                                            RadialAxis(
                                                showLabels: false,
                                                showTicks: false,
                                                startAngle: 270,
                                                endAngle: 270,
                                                minimum: 0,
                                                maximum: 100,
                                                radiusFactor: 0.85,
                                                axisLineStyle: AxisLineStyle(
                                                    color: greenColor.withOpacity(.6),
                                                    thicknessUnit: GaugeSizeUnit.factor,
                                                    thickness: 0.2),
                                                centerX: .5,
                                                centerY: .5,
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      angle: 0,
                                                      widget: Center(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text("4h 20m",textAlign: TextAlign.center,style: utils.labelTextStyle(greenDarkColor)),
                                                              Text("quran",textAlign: TextAlign.center,style: utils.smallTextStyle(greenDarkColor)),
                                                            ],
                                                          )
                                                      )),
                                                ],
                                                pointers: <GaugePointer>[
                                                  RangePointer(
                                                      value: 70.0,
                                                      cornerStyle: CornerStyle.bothCurve,
                                                      enableAnimation: true,
                                                      animationDuration: 1200,
                                                      animationType: AnimationType.ease,
                                                      sizeUnit: GaugeSizeUnit.factor,
                                                      color: greenDarkColor,
                                                      width: 0.2),
                                                ]),
                                          ],
                                        )

                                    ),

                                    // ---- this code is commented by amon ---
                                    // SingleCircularSlider(
                                    //       288,
                                    //       190,
                                    //       height: 300.0,
                                    //       width: 300.0,
                                    //       secondarySectors: 10,
                                    //       baseColor: greenColor,
                                    //       selectionColor: greenDarkColor,
                                    //       handlerColor: greenColor,
                                    //       handlerOutterRadius: 10.0,
                                    //       showRoundedCapInSelection: false,
                                    //       showHandlerOutter: false,
                                    //
                                    //       sliderStrokeWidth: 10,
                                    //       child: Column(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         children: [
                                    //           Text('1h 42m',
                                    //               style: utils.labelTextStyle(greenDarkColor)),
                                    //           Text('On Quran',
                                    //               style: TextStyle(
                                    //                   fontSize: 10.0,
                                    //                   color: greenDarkColor,
                                    //                   fontStyle: FontStyle.italic)),
                                    //         ],
                                    //       ),
                                    //       shouldCountLaps: false,
                                    // ),
                                    // SleekCircularSlider(
                                    //   // innerWidget: InnerWidget(72.0),
                                    //   // Container(
                                    //   //   child: Center(
                                    //   //     child: Text("72",style: utils.labelTextStyle(greenDarkColor),),
                                    //   //   ),
                                    //   // ),
                                    //   appearance: CircularSliderAppearance(
                                    //       customWidths: CustomSliderWidths(progressBarWidth: 7,trackWidth: 7),
                                    //
                                    //   ),
                                    //   min: 0,
                                    //   max: 100,
                                    //   initialValue: 72,
                                    // )
                                    // Image.asset("assets/images/progress.PNG",fit: BoxFit.cover,),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Lifetime: 1d 16hr 37m",style: utils.labelTextStyle(greenColor),),
                                  Text("Since 22 Jan 2021 08:00",style: utils.smallTextStyle(greenColor),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text("Sadqa Jaria Gift Pool",style: utils.labelTextStyle(greenColor),),
                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: Image.asset("assets/images/quranImage.png",fit: BoxFit.contain ,),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("0 Quran Copies gifted",style: utils.labelTextStyle(greenColor),),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Quran Engagement Time",style: utils.titleTextStyle(greenColor),)),
                      SizedBox(height: 20,),
                      Container(
                        height: 250,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: dataList==null?
                        Container():ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(var i=0;i<dataList.data.length;i++)
                              listItem(dataList.data[i])
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      reciter==null?Container(child: Center(child: CupertinoActivityIndicator(),),)
                          :RecitationsWidget(reciter),
                      SizedBox(height: 15,),
                      reciter==null?Container():languages==null?Container(child: Center(child: CupertinoActivityIndicator(),),)
                          :LanguageWidget(languages),
                      SizedBox(height: 15,),
                      languages==null?Container():tafsirs==null?Container(child: Center(child: CupertinoActivityIndicator(),),)
                          :TafsirWidget(tafsirs),
                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Quran Font",style: utils.titleTextStyle(greenColor),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(var i =0;i<arabicFonts.length;i++)
                              InkWell(
                                onTap: () async {
                                  activeFontIndex = i;
                                   await _storage.write(key: fontKey, value: activeFontIndex.toString());
                                   setState(() {});
                                },
                                child: Container(
                                  // padding: EdgeInsets.all(20),
                                  height: 75.0,
                                  width: 75.0,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(color: i==activeFontIndex?greenColor:whiteColor,shape: BoxShape.circle),
                                  child: Center(child: Container(child: Text("بِسْمِ",textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: utils.labelFontTextStyle( i==activeFontIndex?whiteColor:greenColor,isArabic:true,font: arabicFonts[i] ),))),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        color: greenColor.withOpacity(.3),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("15 lines",style: utils.smallTextStyle(greenColor),),
                                  CupertinoSwitch(
                                      value: showImageSwitch,
                                      activeColor: greenColor,
                                      trackColor: greenColor.withOpacity(.3),
                                      onChanged: (value){
                                        showImageSwitch = !showImageSwitch;
                                        setState(() {});
                                      }
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Side Mark",style: utils.smallTextStyle(greenColor),),
                                  CupertinoSwitch(
                                      value: showImageSwitch,
                                      activeColor: greenColor,
                                      trackColor: greenColor.withOpacity(.3),
                                      onChanged: (value){
                                        showImageSwitch = !showImageSwitch;
                                        setState(() {});
                                      }
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Screen Timeout",style: utils.smallTextStyle(greenColor),),
                                  CupertinoSwitch(
                                      value: showImageSwitch,
                                      activeColor: greenColor,
                                      trackColor: greenColor.withOpacity(.3),
                                      onChanged: (value){
                                        showImageSwitch = !showImageSwitch;
                                        setState(() {});
                                      }
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 10,),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: whiteColor),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: 100,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                child:Column(
                                  children: [
                                    Text("Size Adjust",style: utils.smallTextStyle(whiteColor)),
                                    Text(activeFontSize.toStringAsFixed(0).toString(),style: utils.fontSizeText(whiteColor,20)),
                                  ],
                                ),
                              )
                            ),
                            Expanded(
                              child:  Container(
                                  width: 50,
                                  child: Center(
                                    child: utils.slider(activeFontSize, 18.0, 32.0, (val) async {
                                      activeFontSize = val;
                                      await _storage.write(key: fontSizeKey, value: val.toString());
                                      setState(() {
                                      });
                                    })
                                    ),
                                  )
                              ),

                            Container(
                              width: 70,
                              child: Center(
                                child: Text("بِسْمِ",style: utils.fontSizeText(greenColor, activeFontSize),),
                              ),
                            )

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Theme",style: utils.titleTextStyle(greenColor),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 90,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(var i =0;i<10;i++)
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(color: i==0?greenColor:whiteColor,shape: BoxShape.circle),
                                    child: Center(child: Container(
                                        child: Icon(CupertinoIcons.moon,color: i==0?whiteColor:greenColor, )
                                    )),
                                  ),
                                  Text("Night",textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: utils.smallTextStyle(greenColor),),
                                ],
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Landing Page",style: utils.titleTextStyle(greenColor),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Selected Page:",style: utils.smallTextStyle(greenColor),),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: utils.boxShadow()
                                ),
                                child:  DropdownButton<String>(
                                  focusColor: greenColor,
                                  value: "Dashboard",
                                  isExpanded: true,
                                  icon: Icon(CupertinoIcons.chevron_down,color: greenColor,size: 14,),
                                  style: utils.labelTextStyle(greenColor),
                                  items: <String>['Dashboard', 'Settings',].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style: utils.smallTextStyle(greenColor),),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("More Apps",style: utils.titleTextStyle(greenColor),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(var i =0;i<10;i++)
                              Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(color: i==0?greenColor:whiteColor,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Container(
                                    child: Container()
                                )),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("General",style: utils.titleTextStyle(greenColor),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for(var i =0;i<10;i++)
                              Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(color: i==0?greenColor:whiteColor,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Container(
                                    child: Container()
                                )),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listItem(item) {
    Random rnd = new Random();
    var r = 1 + rnd.nextInt(6 - 1);

    return Container(
      height: 250,
      width: 250,
      margin:EdgeInsets.symmetric(horizontal: 7),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  child:Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          "assets/images/ayahImages/"+(r).toString()+".jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: greenColor.withOpacity(.3),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(""+item.ayat,style: utils.quranTextStyle(whiteColor,isArabic: true,)),
                            Text(""+item.translation,style: utils.descriptionTextStyle(whiteColor)),

                          ],
                        ),
                      )
                    ],
                  )
              )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Icon(Icons.share_outlined,color: greenColor,)),
                Expanded(child: Icon(Icons.cloud_download_outlined,color: greenColor,)),
                Expanded(child: Icon(CupertinoIcons.hand_thumbsup,color: greenColor,)),
              ],
            ),
          )
        ],
      ),
    );
  }


  getReciterList()
  async {
    var apis = QuranApis();
    Response response = await apis.getRecitationsList();
    if(response.statusCode == 200)
    {
      reciter = RecitationsListApiResponse.fromJson(jsonDecode(response.body));

    }
    else
    {
      utils.showToast("Some error to get surah list", context);
    }
  }

  getLanguageList() async {

    var apis = QuranApis();
    Response response = await apis.getLanguageList();
    if(response.statusCode == 200)
    {
      languages = LanguagesListApiResponse.fromJson(jsonDecode(response.body));
    }
    else
    {
      utils.showToast("Some error to get Languages", context);
    }
  }

  getTafsirList() async {

    var apis = QuranApis();
    Response response = await apis.getTafsirsList();
    if(response.statusCode == 200)
    {
      print(response.body);
      tafsirs = TafsirListApiResponse.fromJson(jsonDecode(response.body));
    }
    else
    {
      utils.showToast("Some error to get Tafsir", context);
    }
  }

  getPrayerTime() async {
    var apis = PrayerTimeApi();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    Response response = await apis.getTodayPrayerTime({"city":"Lahore","country":"Pakistan","method":"1","date_or_timestamp":formattedDate});
    if(response.statusCode == 200)
    {
      prayerTime = CurrentDatePrayerTimeApiResponse.fromJson(jsonDecode(response.body));
    }
    else
    {
      utils.showToast("Some error to get data", context);
    }
  }


  getRandomAyah() async {
    var apis = QuranApis();
    for(var i=0;i<5;i++) {
      Response response = await apis.getRandomAyah();
      if (response.statusCode == 200) {
        randomAyah = RandomAyahApiResponse.fromJson(jsonDecode(response.body));
        String txt1="";
        String txt2="";
        for(var item in randomAyah.verse.words)
          {
            txt1 = txt1+item.codeV1;
            txt2 = txt2+item.translation.text;
          }
        arabicList.add(txt1);
        translationList.add(txt2);
      }
      else {
        utils.showToast("Some error to get data", context);
      }
      if(i==4)
        {
          setState(() {});
        }
    }
  }

  List<String> arabicList=[];
  List<String> translationList=[];

  buildAyahList() async {
    var apis = QuranApis();
    for(var i=0;i<5;i++) {
      Response response = await apis.getRandomAyah();
      if (response.statusCode == 200) {
        randomAyah = RandomAyahApiResponse.fromJson(jsonDecode(response.body));
        String txt1="";
        String txt2="";
        for(var item in randomAyah.verse.words)
        {
          txt1 = txt1+item.codeV1;
          txt2 = txt2+item.translation.text;
        }
        arabicList.add(txt1);
        translationList.add(txt2);
      }
      else {
        utils.showToast("Some error to get data", context);
      }
      if(i==4)
      {
        setState(() {});
      }
    }
  }

  getAyahList() async {

    var apis = MainScreenApi();
    DateTime now = DateTime.now();
    Response response = await apis.getDataList();

    if(response.statusCode == 200)
    {
      dataList = MainAyahListApiResponse.fromJson({"data":jsonDecode(response.body)});
    }
    else
    {
      utils.showToast("error to get data", context);
    }
  }



}