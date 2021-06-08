import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class TajweedRulesScreen extends StatefulWidget {
  @override
  _TajweedRulesScreenState createState() => _TajweedRulesScreenState();
}

class _TajweedRulesScreenState extends State<TajweedRulesScreen> {

  var utils = AppUtils();
  var switch1 = true;
  var activeIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greenColor.withOpacity(.1),
          padding: EdgeInsets.symmetric(horizontal: 15),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mushaf font only",style: utils.labelTextStyle(greenDarkColor),),
                        Text("Content Update",style: utils.smallTextStyle(greenColor),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    for(var i = 0; i <7;i++)
                      InkWell(
                        onTap: (){
                          activeIndex = i;
                          setState(() {});
                          },
                        child: listItem(i==activeIndex?true:false),
                      )
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  listItem(isActive)
  {
    return Column(
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
                        Text("اﻟﺈِبْتِدَاءُ اﻟﺖَّامُ",style: utils.labelTextStyle(greenColor),),
                        Text("Madd 4 or 5 beats beats(mandatory)",style: utils.smallTextStyle(greenColor),),
                      ],
                    ),
                  ),
                  Icon(Icons.volume_up_outlined,color: isActive?greenDarkColor:greenColor,size: 20,),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }

}
