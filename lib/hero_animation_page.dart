


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hero_animation extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Hero Animation Page',)),
     body: Container(
     child:Hero(tag: 'background', child: Image.asset('assets/images/dog.png'),
     ),
     ),
    );}
}