import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/DuaModels/DuaCategoryModel.dart';
import 'package:quran/Screens/ExtraScreens/DuaDetailScreen.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {

  var utils = AppUtils();

  var searchController  = TextEditingController();


  late DuaCategoryModel categories;
  late List<DuaCategories>  categoriesFiltered;


  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {

    final String response = await rootBundle.loadString('assets/jsonData/categories.json');

    var jsonDecoded = jsonDecode(response);
    categories = DuaCategoryModel.fromJson(jsonDecoded);
    categories.duaCategories = categories.duaCategories.take(14).toList();
    categoriesFiltered = categories.duaCategories;

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
              Container(
                child:utils.searchInputField(searchController, "Search...", whiteColor, greenDarkColor,onChange: (val){
                  filterData(val);
                }),
              ),
              Expanded(
                child: Container(
                  // ignore: unnecessary_null_comparison
                  child: categoriesFiltered==null?Center(child: CupertinoActivityIndicator(),)
                      :ListView(
                    children:[
                      SizedBox(height: 10,),
                      Text("Categories",style: utils.subTitleTextStyle(greenDarkColor),),
                      SizedBox(height: 10,),
                      Wrap(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>CategoryDuaScreen(0)),
                            );
                          },
                          child: utils.categoriesItem(duaIcons[0],"All",blackColor),
                        ),
                        for(var item in categoriesFiltered)
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>CategoryDuaScreen(item.iId)),
                            );
                          },
                          child: utils.categoriesItem(duaIcons[item.iId],item.enTitle,blackColor),
                        )
                      ],
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

  filterData(val) {
    categoriesFiltered = categories.duaCategories;
    categoriesFiltered = categoriesFiltered.where((element) => element.enTitle.contains(val)).toList();
    setState(() {
    });
  }
}
