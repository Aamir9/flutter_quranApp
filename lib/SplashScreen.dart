import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quran/AppConstants/AppContants.dart';


// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {

  var nextScreen;
  SplashScreen(this.nextScreen);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    myData();
    moveToNextScreen();
  }

  myData()
  async{
    var _storage = FlutterSecureStorage();

    //Font index
    var fontIndex = await _storage.read(key: fontKey);
    if (fontIndex != null) {
      activeFont = int.parse(fontIndex.toString());
    }
    else {
      await _storage.write(key: fontKey, value: "0");
    }

    //Font size
    var fontSize = await _storage.read(key: fontSizeKey);
    if (fontSize != null) {
      activeFontSize = double.parse(fontSize.toString());
    }
    else {
      await _storage.write(key: fontSizeKey, value: "22");
    }

    //Reciter index
    var reciter = await _storage.read(key: reciterKey);
    if (reciter != null) {
      activeReciter = int.parse(reciter.toString());
    }
    else {
      await _storage.write(key: reciterKey, value: "0");
    }

    //Reciter index
    var language = await _storage.read(key: languageKey);
    if (language != null) {
      activeLanguage = int.parse(language.toString());
    }
    else {
      await _storage.write(key: languageKey, value: "0");
    }


    //Reciter index
    var tafsir = await _storage.read(key: tafsirKey);
    if (tafsir != null) {
      activeTafsir = int.parse(tafsir.toString());
    }
    else {
      await _storage.write(key: tafsirKey, value: "0");
    }

  }

  moveToNextScreen() async{

    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement( MaterialPageRoute(
        settings:RouteSettings(name: "Home Screen"),
        builder: (BuildContext context) => widget.nextScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:greenColor,
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/logo.png",width: 210,height: 210,),
        ),
      ),
    );
  }
}

