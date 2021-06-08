import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/DuaModels/DuaModel.dart';

// ignore: must_be_immutable
class CategoryDuaScreen extends StatefulWidget {

  var groupId;
  CategoryDuaScreen(this.groupId);

  @override
  _CategoryDuaScreenState createState() => _CategoryDuaScreenState();
}

class _CategoryDuaScreenState extends State<CategoryDuaScreen> {

  var utils = AppUtils();



  late DuaModel duaList;


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {

    final String response = await rootBundle.loadString('assets/jsonData/dua.json');

    var jsonDecoded = jsonDecode(response);
    duaList = DuaModel.fromJson(jsonDecoded);
    duaList.duaList = widget.groupId == 0
        ?duaList.duaList.toList()
      :duaList.duaList.where((e)=>e.groupId==widget.groupId).toList();
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.appBar(),
      body: SafeArea(
        child: Container(
            color: greenColor.withOpacity(.1),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 20,),

                Expanded(
                  child: Container(
                    // ignore: unnecessary_null_comparison
                    child: duaList==null?Center(child: CupertinoActivityIndicator(),)
                        :Column(

                        children:[
                          SizedBox(height: 10,),
                          Text("Dua",style: utils.subTitleTextStyle(greenDarkColor),),
                          SizedBox(height: 10,),
                          Expanded(
                            child: ListView(
                              children: [
                                for(var item in duaList.duaList)
                                  utils.duaListItem(item.arDua,item.enTranslation)
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
