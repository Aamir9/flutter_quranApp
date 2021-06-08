
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class AudioSettings extends StatefulWidget {
  @override
  _AudioSettingsState createState() => _AudioSettingsState();
}

class _AudioSettingsState extends State<AudioSettings> {

  var utils = AppUtils();
  var advanceSetting =true;
  var _volumeValue =10.0;

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
                    Text("Reciter",style: utils.labelTextStyle(greenDarkColor),),
                    SizedBox(height: 10,),
                    utils.button(greenColor, greenColor, "As-Sunday-Shrayam", null, whiteColor, (){
                    }),
                    SizedBox(height: 10,),

                    Text("Volume",style: utils.labelTextStyle(greenDarkColor),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: utils.boxShadow(),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child:utils.slider(_volumeValue, 0.0, 100.0, (val) {
                        _volumeValue = val;
                        setState(() {});
                      },
                      ),

                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
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
                                    Text("Aye Delay",style: utils.labelTextStyle(greenColor),),
                                    Text("Set a delay or pause of few secs in between Ayaat",style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Text("None",style: utils.smallTextStyle(greenDarkColor),),
                            ],
                          ),
                          SizedBox(height: 0,),
                          Container(
                            child: utils.slider(_volumeValue, 0.0, 100.0, (val) {
                            _volumeValue = val;
                            setState(() {});},),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
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
                                    Text("Range",style: utils.labelTextStyle(greenColor),),
                                    Text("Set a range between Sura, Ruku, Page or Aye for reading",style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Text("1 aya",style: utils.smallTextStyle(greenDarkColor),),
                            ],
                          ),
                          SizedBox(height: 0,),
                          Container(
                            child: utils.slider(_volumeValue, 0.0, 100.0, (val) {
                              _volumeValue = val;
                              setState(() {});},),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
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
                                    Text("Range Repeat ",style: utils.labelTextStyle(greenColor),),
                                    Text("Set the repeat parameter for the set range",style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Text("Onace",style: utils.smallTextStyle(greenDarkColor),),
                            ],
                          ),
                          SizedBox(height: 0,),
                          Container(
                            child: utils.slider(_volumeValue, 0.0, 100.0, (val) {
                              _volumeValue = val;
                              setState(() {});},),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
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
                                    Text("Playback Speed",style: utils.labelTextStyle(greenColor),),
                                    Text("Set the playback speed of the Quran audio",style: utils.smallTextStyle(greenColor),),
                                  ],
                                ),
                              ),
                              Text("1.0x",style: utils.smallTextStyle(greenDarkColor),),
                            ],
                          ),
                          SizedBox(height: 0,),
                          Container(
                            child: utils.slider(_volumeValue, 0.0, 100.0, (val) {
                              _volumeValue = val;
                              setState(() {});},),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(flex:1,child: Container()),
                        Expanded(flex:2,child: utils.button(greenColor, greenColor, "Add Widget".toUpperCase(), null, whiteColor, (){})),
                        Expanded(flex:1,child: Container())
                      ],
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
}
