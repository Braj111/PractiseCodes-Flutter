//import 'dart:js_util';

import 'dart:async';

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
  bool isFirst = true;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //Timer(Duration(seconds: 4), (){
    //reload(); // Don't call setState in initState directly---> bad practice becouse sometimes you may call a widget that has not been formed(once)
    //});



 void reload(){
    setState(() {
      if(isFirst){
        isFirst=false;
      }else{
        isFirst=true;
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Foo Animation'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            AnimatedCrossFade(
                firstChild: Container(height: 200, width: 200,color: Colors.green.shade200,),
                secondChild: Image.asset('assets/images/man.png', width: 200, height: 200,),
                crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(seconds: 2),
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.bounceInOut,
                //sizeCurve:Curves.easeInOut, // When there is difference in size between childrens

            ),
            ElevatedButton(onPressed: (){
              reload();
            }, child: Text('Animate'))
          ],
        ),
      )

    );
   }

}
