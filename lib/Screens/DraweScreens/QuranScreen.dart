
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quran/Apis/QuranApis.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/quranSurahApiResponse.dart';
import 'package:quran/Screens/ExtraScreens/SuraDetailScreen.dart';

class QuranScreen extends StatefulWidget {
  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {


  var utils = AppUtils();
  var activeTab = 1;
  var activeItem = 1;

   var quranSurah;


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async {
    await getSuranList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.appBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
          color: greenColor.withOpacity(.1),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(color: greenColor,borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(color: whiteColor,borderRadius:BorderRadius.circular(5) ),

                    width: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              activeTab=1;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(borderRadius:  BorderRadius.circular(5),color: activeTab==1?greenColor:whiteColor,boxShadow: utils.boxShadow()),
                              child: Center(child: Text("Juz",style: utils.smallTextStyle(activeTab==1?whiteColor:greenColor),)),),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              activeTab=2;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: activeTab==2?greenColor:whiteColor,boxShadow: utils.boxShadow()),
                              child: Center(child: Text("Sura",style: utils.smallTextStyle(activeTab==2?whiteColor:greenColor),)),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                // ignore: unnecessary_null_comparison
                child: quranSurah == null ?Container(child: Center(child: CupertinoActivityIndicator(),),)
                    :ListView(
                  children: [
                    for(var item in quranSurah.data)
                      InkWell(
                        onTap: (){
                          activeItem=item.number;
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SurahDetailScreen(item.number)),
                          );
                        },
                        child: listItem(item.number==activeItem?true:false,item),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listItem(isActive,Data data)
  {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: isActive?5:10),
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          decoration: BoxDecoration(color: whiteColor,borderRadius: isActive?BorderRadius.circular(7):BorderRadius.circular(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.number.toString()+". "+data.englishName,style: utils.labelTextStyle(greenDarkColor),overflow: TextOverflow.ellipsis),
              Text(data.name+"   ",style: utils.labelTextStyle(greenColor,isArabic: true),overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,),
            ],
          ),
        ),
        Container(padding: EdgeInsets.symmetric(horizontal: 15),child: Divider(height: 2,color: greenColor.withOpacity(.4),))
      ],
    );
  }

  getSuranList()
  async {
    var apis = QuranApis();
    Response response = await apis.getAllSurahList();
    if(response.statusCode == 200)
      {
        quranSurah = QuranSurahApiResponse.fromJson(jsonDecode(response.body));

      }
    else
      {
        // utils.showToast("Some error to get surah list", context);
      }
  }


  getJuzList()
  async {
    var apis = QuranApis();
    Response response = await apis.getAllSurahList();
    if(response.statusCode == 200)
    {
      quranSurah = QuranSurahApiResponse.fromJson(jsonDecode(response.body));

    }
    else
    {
      // utils.showToast("Some error to get surah list", context);
    }
  }
}
