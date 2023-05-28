import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepolean_codex/IntroPage.dart';
import 'package:nepolean_codex/main.dart';

class splash_screen extends StatefulWidget{
  @override
  State<splash_screen> createState() => _splash_screenState();

}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() { //this function will be called the everytime when a page is build
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text('KING BRAJ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),)
      ),
        ),
    );
  }
}
