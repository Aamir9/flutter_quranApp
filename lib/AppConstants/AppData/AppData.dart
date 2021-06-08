


import 'package:quran/Models/HomeOptions/HomeOption.dart';
import 'package:quran/Screens/DraweScreens/CategoriesScreen.dart';
import 'package:quran/Screens/DraweScreens/PrayerTimeScreen.dart';
import 'package:quran/Screens/DraweScreens/QuranScreen.dart';
import 'package:quran/Screens/ExtraScreens/MadinahLiveScreen.dart';
import 'package:quran/Screens/ExtraScreens/MakkahLiveScreen.dart';
import 'package:quran/Screens/ExtraScreens/QiblaCompassSceen.dart';
import 'package:quran/Screens/ExtraScreens/SuraDetailsWithTanslation.dart';

List<HomeOption> homeOptions = [
  HomeOption(id: 1,title: "Quran Majeed",image: "assets/images/quranImage1.png",screen: QuranScreen()),
  HomeOption(id: 2,title: "Makkah Live",image: "assets/images/qiblaImage.png",screen: MakkahLiveScreen()),
  HomeOption(id: 3,title: "Madinah Live",image: "assets/images/madinaImage.png",screen: MadinahLiveScreen()),
  HomeOption(id: 4,title: "Dua",image: "assets/images/duaImage.png",screen: CategoriesTab()),
  HomeOption(id: 5,title: "Prayers Time",image: "assets/images/prayerTimeImage.png",screen: PrayerTimeScreen()),
  HomeOption(id: 6,title: "Qibla Compass",image: "assets/images/qiblaDirection.png",screen: QiblaCompassScreen()),
  HomeOption(id: 7,title: "Visual Quran",image: "assets/images/visualQuran1.png",screen: SuraDetailWithTranslationScreen()),
  HomeOption(id: 8,title: "Messages",image: "assets/images/message.png",screen: QuranScreen()),
];