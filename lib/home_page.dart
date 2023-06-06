import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Container(
          color: Colors.blue.shade100,
          child: Center(child: Icon(Icons.home, size: 100,color: Colors.orange,)),
        ),
      ) ,
    );
  }

}