//import 'dart:js_util';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nepolean_codex/IntroPage.dart';
import 'package:nepolean_codex/hero_animation_page.dart';
import 'package:nepolean_codex/splash_screen.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHARED PREFERENCE',
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

class _MyHomePageState extends State<MyHomePage>{ // we can use multiple mixing class together


  var nameController =TextEditingController();
  static const String KEYNAME ="name";
  var nameValue ="No value Saved";
  //We have used uppercase in name here because for 'Static Const' type variables to be shown differently for easy identification

  @override
  void initState() {
    super.initState();
    getValue();
    /*This is a async function, hence we need to use async keyword but initState cannot be controlled by
     developers hence async won't work here therefore just create a calling here and initialize it somewhere else.
      */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Shared Preference'),),
      body:Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22)
                    )
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                var name = nameController.text.toString();
                var prefs = await SharedPreferences.getInstance();
                prefs.setString(KEYNAME, name);
                //prefs.setString("name", nameController.text.toString());

                //In data-bases, key --> columns , value--> corresponding value to that column
              }, child: Text('Save')),
              SizedBox(height: 20,),
              Text(nameValue)
            ],
          ),
        ),
      )
    );
   }

    getValue() async{
    var prefs = await SharedPreferences.getInstance();
    var  getName=  prefs.getString(KEYNAME);
    nameValue = getName !=null ? getName : "No value Saved";
    setState(() {});
    }
}
