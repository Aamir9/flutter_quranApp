import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'Screens/DraweScreens/MainScreen.dart';
import 'SplashScreen.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Perfect Holy Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: greenColor,
      ),
      home: SplashScreen(MainScreen()),
    );
  }
}
