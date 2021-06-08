import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/AppUtils/qibla_compass.dart';

class QiblaCompassScreen extends StatefulWidget {
  @override
  _QiblaCompassScreenState createState() => _QiblaCompassScreenState();
}

class _QiblaCompassScreenState extends State<QiblaCompassScreen> {

  var utils = AppUtils();
  // ignore: unused_field
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: utils.appBar(),
      body: SafeArea(
        child:Container(
          color: greenColor.withOpacity(.1),
          child: FutureBuilder(
            future: _deviceSupport,
            builder: (_, AsyncSnapshot<bool?> snapshot) {
              
              if (snapshot.connectionState == ConnectionState.waiting)
                return CupertinoActivityIndicator();
              if (snapshot.hasError)
                return Center(
                  child: Text("Device not support this feature!",style: utils.headingTextStyle(Colors.red.withOpacity(7)),),
                );

              if (snapshot.data != null)
                return QiblaCompass();
              else
               return Center(
                       child: Text("Device not support this feature!",style: utils.headingTextStyle(Colors.red.withOpacity(7)),),
                   );
              //  LocationErrorWidget();
            },
          ),
        ),
      ),
    );
  } 
}
