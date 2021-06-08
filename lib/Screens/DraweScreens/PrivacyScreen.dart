import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.appBar(),
      body: SafeArea(
        child: Container(
            color: greenColor.withOpacity(.1),
          child:Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child:Text("Privacy Policy",style: utils.titleTextStyle(greenDarkColor),)
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: utils.boxShadow(),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/privacy.PNG",fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 30,),
                      Text("Privacy Policy",style: utils.titleTextStyle(greenDarkColor),),
                      SizedBox(height: 20,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: ListView(
                            children: [
                              Text(
                                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
                                "\n\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                              style: utils.descriptionTextStyle(greenDarkColor),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),

            ],
          )
        ),
      ),
    );
  }
}
