import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepolean_codex/IntroPage.dart';
import 'package:nepolean_codex/home_page.dart';
import 'package:nepolean_codex/login_page.dart';
import 'package:nepolean_codex/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_sharedPref extends StatefulWidget{
  @override
  State<splash_sharedPref> createState() => splash_screenState();

}

class splash_screenState extends State<splash_sharedPref> {
  static const String KEYVALUE = 'Login';

  @override
  void initState() { //this function will be called the everytime when a page is build
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Text('WeBiased', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white))
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLogin = sharedPref.getBool(KEYVALUE);
    
    
    Timer(Duration(seconds: 2),(){
      if(isLogin!=null){
        if(isLogin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
      }

    });
  }
}
