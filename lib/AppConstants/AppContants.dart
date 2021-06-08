

import 'package:flutter/cupertino.dart';

const greenColor = Color(0xFF5FBEAA);
const greenDarkColor = Color(0xFF085646);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF262626);



//Font Sizes

final headingFontSize = 22.0;
final newTitleFontSize = 17.0;
final titleFontSize = 17.0;
const subTitleFontSize = 15.0;
final descriptionFontSize = 14.0;
final labelFontSize = 13.0;
final smallFontSize = 11.0;



//font weights
final xBold = FontWeight.w900;
final bold = FontWeight.bold;
final normal = FontWeight.normal;
final light = FontWeight.w600;

final googleMapKey ="AIzaSyC8kRImPuX2uzBQCU9Q1pD68fSjZuBUJMQ";


var apiBaseUrl  = "api.alquran.cloud";
var subUrl = "v1/";

var quranApiBaseUrl = "api.quran.com";
var quranSubUrl = "/api/v4/";

var prayerTimeApiBaseUrl = "api.aladhan.com";
var prayerTimeSubUrl = "/v1/";

var getDataApiUrl = "http://shabbirbros.com/api_adnan/get_data.php";




var duaIcons = [
  "assets/duaIcons/hand.png","assets/duaIcons/bed.png","assets/duaIcons/clock.png","assets/duaIcons/toilet.png","assets/duaIcons/food.png",
  "assets/duaIcons/joy.png","assets/duaIcons/distress.png","assets/duaIcons/travel.png","assets/duaIcons/mosque.png","assets/duaIcons/mosque.png",
  "assets/duaIcons/qibla.png","assets/duaIcons/sikness.png","assets/duaIcons/shopping.png","assets/duaIcons/quran.png","assets/duaIcons/fiqhi.png",
];


List<String> arabicFonts = ["Amiri","Hafs","lateef"];

int activeFont = 0;
double activeFontSize = 22.0;
int activeReciter = 1;
int activeLanguage = 1;
int activeTafsir = 1;
String fontKey = "fontStorage";
String fontSizeKey = "fontSizeStorage";
String reciterKey = "reciterStorage";
String languageKey = "languageStorage";
String tafsirKey = "tafsirStorage";