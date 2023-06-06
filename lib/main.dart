//import 'dart:js_util';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nepolean_codex/IntroPage.dart';
import 'package:nepolean_codex/hero_animation_page.dart';
import 'package:nepolean_codex/home_page.dart';
import 'package:nepolean_codex/login_page.dart';
import 'package:nepolean_codex/splash_screen.dart';
import 'package:nepolean_codex/splash_screen.dart';
import 'package:nepolean_codex/splash_shared_Pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:nepolean_codex/ui_helper/util.dart';
// import 'package:intl/intl.dart';
// import 'package:nepolean_codex/widgets/rounded_btn.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHARED PREFERENCE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          subtitle1: TextStyle(fontSize: 51, fontWeight: FontWeight.w200, fontStyle: FontStyle.normal),
        )
      ),
      home: splash_sharedPref()
    );
  }
}

class MyHomePage extends StatelessWidget {
 // we can use multiple mixing class together
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Shared Preference'),),
      body:Container());
   }
}
