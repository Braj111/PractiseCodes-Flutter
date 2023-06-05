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
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2)); // vsync need a value what will remain synchronous throughout an will update value
    // 'this' represents class here
    animation= Tween(begin: 200.0,end: 100.0).animate(animationController);
    colorAnimation =ColorTween(begin: Colors.blue, end: Colors.orange).animate(animationController);

    animationController.addListener(() {
      //print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Tween Animation'),),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: colorAnimation.value,
        ),
      )

    );
   }
}
