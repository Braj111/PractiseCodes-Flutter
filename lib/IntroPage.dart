import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepolean_codex/main.dart';

class IntroPage extends StatelessWidget{
  var nameFromHome;

  IntroPage(this.nameFromHome); //CONSTRUCTOR
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Intro'),
     ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('Welcome $nameFromHome ', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold)),
        SizedBox(height: 11),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => MyHomePage())); //This intution of push operation tells us that screens are arrangen in stack format and follows LIFO
      }, child: Text('Back'))
      ],
      ),
    ));
  }
}