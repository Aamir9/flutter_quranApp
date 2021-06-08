
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/LanguagesListApiResponse.dart';

import '../../Models/QuranModels/LanguagesListApiResponse.dart';

// ignore: must_be_immutable
class LanguageWidget extends StatefulWidget {
  LanguagesListApiResponse languages;
  LanguageWidget(this.languages);
  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {

  var utils = AppUtils();


  final _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Translation",style: utils.titleTextStyle(greenColor),)
        ),
        SizedBox(height: 10,),
       Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for(var item in widget.languages.languages)
                InkWell(
                  onTap: () async {
                    activeLanguage = item.id;
                    await _storage.write(key: languageKey, value: activeLanguage.toString());
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(color: item.id == activeLanguage?greenColor:whiteColor,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text(item.name,maxLines: 3,overflow: TextOverflow.ellipsis,style: utils.labelTextStyle( item.id == activeLanguage?whiteColor:greenColor),)),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }


}
