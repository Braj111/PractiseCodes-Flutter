//import 'dart:js_util';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nepolean_codex/IntroPage.dart';
import 'package:nepolean_codex/hero_animation_page.dart';
import 'package:nepolean_codex/splash_screen.dart';
// import 'package:nepolean_codex/ui_helper/util.dart';
// import 'package:intl/intl.dart';
// import 'package:nepolean_codex/widgets/rounded_btn.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          subtitle1: TextStyle(fontSize: 51, fontWeight: FontWeight.w200, fontStyle: FontStyle.normal),
        )
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState(); //returning a state
  }

}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{ // we can use multiple mixing class together
  late Animation _animation;
  late AnimationController _animationController;
  var listRadius = [150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2), lowerBound: 0.8 ); // vsync need a value what will remain synchronous throughout an will update value
    // 'this' represents class here
    //_animation= Tween(begin: 0.0,end: 1.0).animate(_animationController);
    //we need very small increment(0 to 1 is sufficient) hence that can be achieved through controller itself by default hence we dont need '_animation'
    _animationController.addListener(() {
      //print(animation.value);
      setState(() {});
    });
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Ripple  Animation'),),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: listRadius.map((radius) => Container(
            width: radius*_animationController.value, // this will reduce the circle size as controller value will be between 0 and 1
            height: radius*_animationController.value,
             decoration: BoxDecoration(shape: BoxShape.circle,
                                       color: Colors.blue.withOpacity(1.0-_animationController.value))
          )).toList()
          //2 ways to reduce redundancy either through list mapping of different radius values or by creating a function that will return a widget upon calling
        ),
      )
    );
   }
}
