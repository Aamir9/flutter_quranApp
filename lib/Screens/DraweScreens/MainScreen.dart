import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Screens/DraweScreens/MasjidsMapScreen.dart';
import 'package:quran/Screens/DraweScreens/PrivacyScreen.dart';
import 'package:quran/Screens/DraweScreens/Reciters.dart';

import '../DashboardScreen.dart';
import 'CategoriesScreen.dart';
import 'PrayerSettingScreen.dart';
import 'PrayerSettings.dart';
import 'PrayerTimeScreen.dart';
import 'QuranScreen.dart';
import 'TajweedRulesScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var utils = AppUtils();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  var activeTab = 0;
  List<Widget> drawerScreens = [DashboardScreen(),CategoriesTab(),RecitersScreen(),PrayerTimeScreen(),QuranScreen(),MasjidsMapScreen(),TajweedRulesScreen(),PrayerSettingScreen(), PrayerNotificationSettings(),PrivacyScreen()];
  //List<Widget> drawerScreens = [DashboardScreen(),CategoriesTab(),RecitersScreen(),PrayerTimeScreen(),SearchScreen(),MasjidsMapScreen(),PrivacyScreen()];
  //List<String> drawerLabel = ["Home",    "Dua List",      "Reciters",     "Prayer Time",    "Search Screen",    "Near by Masjids"  ,   "Privacy Policy"];
  List<String> drawerLabel = ["Home",    "Dua List",      "Reciters",     "Prayer Time",      "Quran",    "Near by Masjids"  ,  "Tajweed Rules","Settings", "Prayer Settings",   "Privacy Policy"];

 

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop : _willPopCallback,
      //  onWillPop:() {
      //    return showDialog<bool>(
      //        context: context,
      //        builder: (c)=> AlertDialog(
      //          title: Text('Warning'),
      //          content: Text('Do you really want to exit'),
      //          actions: [
      //            TextButton(
      //              child: Text('Yes'),
      //              onPressed: () {
      //                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      //              },
      //            ),
      //            TextButton(
      //              child: Text('No'),
      //              onPressed: () => Navigator.pop(c, false),
      //            ),
      //          ],
      //        )
      //    );
      //  },
       child:
      Scaffold(
        key: _scaffoldKey,
        appBar: utils.appBar(),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: greenColor.withOpacity(.5),
          ),
          child: Drawer(
          elevation: 2.7,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    for(var i =0;i< drawerLabel.length;i++)
                      InkWell(
                        onTap: (){
                          activeTab = i;
                          _closeEndDrawer();
                          setState(() {});
                        },
                        child: Container(
                          color: activeTab==i?whiteColor:Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(drawerLabel[i],style: utils.labelTextStyle(i==activeTab?greenDarkColor:whiteColor),),
                            ],
                          ),
                        ),
                      ),

                    SizedBox(height: 20,),
                ]
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: greenColor,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(drawerLabel[activeTab],style:  utils.labelTextStyle(whiteColor)),
                      InkWell(
                        onTap: _openEndDrawer,
                        child: Icon(CupertinoIcons.line_horizontal_3_decrease,color: whiteColor,size: 22,)
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: drawerScreens[activeTab],
                )
              ],
            ),
          ),
        ),
      // ),
    )
    );
  } 
  Future<bool> _willPopCallback() async {
    // await Show dialog of exit or what you want
    // then
    
    return true; 
}

}
