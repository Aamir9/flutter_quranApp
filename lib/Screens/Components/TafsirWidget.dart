
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/TafsirListApiResponse.dart';

// ignore: must_be_immutable
class TafsirWidget extends StatefulWidget {
  TafsirListApiResponse tafsirs;
  TafsirWidget(this.tafsirs);
  @override
  _TafsirWidgetState createState() => _TafsirWidgetState();
}

class _TafsirWidgetState extends State<TafsirWidget> {

  var utils = AppUtils();
  var _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Tafsirs",style: utils.titleTextStyle(greenColor),)
        ),
        SizedBox(height: 10,),
       Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for(var item in widget.tafsirs.tafsirs)
                InkWell(
                  onTap: () async {
                    activeTafsir = item.id;
                    await _storage.write(key: tafsirKey, value: activeTafsir.toString());
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(color: item.id == activeTafsir?greenColor:whiteColor,shape: BoxShape.circle),
                    child: Center(
                      child: Container(
                        width: 50,
                        child: Column(
                          children: [
                            Text(item.name,textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,style: utils.smallTextStyle( activeTafsir == item.id?whiteColor:greenColor),),
                          ],
                        )
                      )
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
