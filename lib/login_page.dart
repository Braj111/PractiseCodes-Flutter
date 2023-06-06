import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepolean_codex/home_page.dart';
import 'package:nepolean_codex/splash_shared_Pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatelessWidget{

  var eNameController = TextEditingController();
  var pNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face_2, size: 60,),
            SizedBox(
              height: 21,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: eNameController,
                decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22)
                    )
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: pNameController,
                decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22)
                    )
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () async{
              //if Succesfully LogedIn (Credentials are correct)

              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(splash_screenState.KEYVALUE, true);

              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

            }, child: Text('Login')),

          ],
        ),
      ),
    );
  }

}