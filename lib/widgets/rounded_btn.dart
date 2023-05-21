import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String btnname;  //final because we dont want to change these values
  final Icon? icon;
  final Color? bgcolor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  RoundedButton({ //this is a constructor of our custom widget class
    required this.btnname, //this argument is mandatory because of keyword required
    this.icon,
    this.bgcolor = Colors.blue,  //default argument
    this.textStyle,
    this.callBack}); //void call back is used to define action ex: tapping button does not perform any action is due to this function

  @override
  Widget build(BuildContext context) { // This function is responsible for reflecting change in stateful widgets
    return ElevatedButton(
        onPressed: (){
          callBack!(); // here callback can be nullable and we don't want it to be nullable here by using '!'
          // in onPressed we will use callback function to define different actions performed by each button
        }, child: icon != null ? Row(
      children: [
        icon!,
        Container(width: 10, height: 10),
        Text(btnname, style:textStyle,)
      ],
    ) : Text(btnname, style:textStyle,),
      style: ElevatedButton.styleFrom(
        primary: bgcolor,
         shadowColor:  bgcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21),
          bottomRight: Radius.circular(21)

        ))

      ),//Conditional programming

    );

  }
  
}