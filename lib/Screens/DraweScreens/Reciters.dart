import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quran/Apis/QuranApis.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/RecitationsListApiResponse.dart';

class RecitersScreen extends StatefulWidget {
  @override
  _RecitersSCREENState createState() => _RecitersSCREENState();
}

class _RecitersSCREENState extends State<RecitersScreen> {

  var utils = AppUtils();
  var searchController = TextEditingController();

  var selectedIndex = 1;

  late RecitationsListApiResponse reciter;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()
  async {
    await getReciterList();
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
                child: utils.searchInputField(searchController, "Search", whiteColor, greenDarkColor),
              ),
              SizedBox(height: 30,),
              Expanded(
                // ignore: unnecessary_null_comparison
                child: reciter==null?Center(child: CupertinoActivityIndicator(),)
                :ListView(
                  children: [
                    for(var i = 0;i<reciter.recitations.length;i++)
                     InkWell(
                       onTap: (){
                         selectedIndex = i;
                         setState(() {
                         });
                       },
                       child:  listItem(reciter.recitations[i],selectedIndex==i?true:false,i==0?true:false,i==10?true:false),
                     ),

                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  listItem(Recitations recitation,isSelected,isFirst,isLast)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: isSelected?0:10),
      decoration: BoxDecoration(
        color: isSelected?greenColor:whiteColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isLast||isSelected?10:0),
            bottomRight: Radius.circular(isLast||isSelected?10:0),
            topLeft: Radius.circular(isFirst||isSelected?10:0),
            topRight: Radius.circular(isFirst||isSelected?10:0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(recitation.reciterName,style: utils.labelTextStyle(isSelected?whiteColor:greenDarkColor),),
          Icon(CupertinoIcons.cloud_download_fill,color: isSelected?whiteColor:greenDarkColor,),
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
      // utils.showToast("Some error to get surah list", context);
    }
  }
}
