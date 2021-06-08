import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  var utils = AppUtils();
  var searchController = TextEditingController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: greenColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontFamily: "HelveticaNeue"),
                  unselectedLabelStyle: TextStyle(fontFamily: "HelveticaNeue"),
                  tabs: [
                    Tab(
                      text: 'Exact',
                    ),
                    Tab(
                      text: 'Affixes',
                    ),
                    Tab(
                      text: 'All Root',
                    ),
                    Tab(
                      text: 'Al-quran',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
