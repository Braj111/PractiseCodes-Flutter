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
      home: splash_screen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState(); //returning a state
  }

}

class _MyHomePageState extends State<MyHomePage> {// a State class
  RangeValues values = RangeValues(0, 100); //this may show error, hence change min and max value to required value
  @override
  Widget build(BuildContext context) {
    RangeLabels lables = RangeLabels(values.start.toString(), values.end.toString());
// initialised 'lables' inside build so as to rebuild this again and again as the change happens by the user
    return Scaffold(
      appBar:AppBar(title: Text('My Application'),),
      body: Center(
          child: RangeSlider(
            min: 0,
            max: 100,
            labels: lables,
            divisions: 20,
            activeColor: Colors.orange,
            inactiveColor: Colors.purple,
            values: values,
            onChanged: (newValue){
              values = newValue;
              print('${newValue.start},${newValue.end}'); // this give what user has selected for further use
              setState(() {

              });
            },)

      )

    );
   }

}
