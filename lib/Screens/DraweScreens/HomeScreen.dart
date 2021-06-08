import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: greenColor.withOpacity(.1),

        ),
      ),
    );
  }
}
