
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/RecitationsListApiResponse.dart';

// ignore: must_be_immutable
class RecitationsWidget extends StatefulWidget {
  RecitationsListApiResponse reciter;
  RecitationsWidget(this.reciter);
  @override
  _RecitationsWidgetState createState() => _RecitationsWidgetState();
}

class _RecitationsWidgetState extends State<RecitationsWidget> {

  var utils = AppUtils();
  var showImageSwitch = false;
  final _storage = FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reciter",style: utils.titleTextStyle(greenColor),),
                Row(
                  children: [
                    CupertinoSwitch(
                        value: showImageSwitch,
                        activeColor: greenColor,
                        trackColor: greenColor.withOpacity(.3),
                        onChanged: (value){
                          showImageSwitch = !showImageSwitch;
                          setState(() {});
                        }
                    ),
                    Text("Photo",style: utils.smallTextStyle(greenColor),),
                  ],
                )
              ],
            )
        ),
        SizedBox(height: 20,),
       Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for(var item in widget.reciter.recitations)
                InkWell(
                  onTap: () async {
                    activeReciter = item.id;
                    await _storage.write(key: reciterKey, value: activeReciter.toString());
                    setState(() {});
                  },
                  child: Container(
                    width: 75,
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 65,
                          height: 60,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),color:activeReciter==item.id?greenColor:whiteColor,
                              border:Border.all(color: greenColor,width: 2)
                          ),
                          child: Center(
                            child:Text(item.reciterName.substring(0,1),style: utils.subTitleTextStyle(activeReciter==item.id?whiteColor:greenColor),)
                          )
                          // Image.asset("assets/images/abdul-rahman-al-sudais.png",fit: BoxFit.cover,),
                        ),
                        SizedBox(height: 5,),
                        Text(item.reciterName,textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: utils.smallTextStyle(greenColor),),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }


}




