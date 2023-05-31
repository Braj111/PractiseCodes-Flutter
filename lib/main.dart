//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:nepolean_codex/IntroPage.dart';
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

class _MyHomePageState extends State<MyHomePage> {


  var _height= 200.0;     //"_var" underscore at starting used to make this variable private
  var _width = 100.0;    // should be double as Animated container height and width are by default double
  var flag = false;
  Decoration myDecor= BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.orange);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('BMI APP'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve:Curves.bounceInOut , //for changing rate of change of motion ... IN--> animation Start, Out--> animation end
              height: _height, // these arguments are double hence initialize it as double value
              width: _width,
              decoration: myDecor,

            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if (!flag){
                  _width= 200.0;
                  _height=100.0;
                  myDecor = BoxDecoration(borderRadius: BorderRadius.circular(504), color: Colors.green);
                  flag = true;
                } else{
                  _width= 100.0;
                  _height=200.0;
                  flag = false;
                  myDecor= BoxDecoration(borderRadius: BorderRadius.circular(0), color: Colors.orange);
                }
              });

            }, child: Text('Animate'))
          ],
        ),
      )

    );
   }

}
