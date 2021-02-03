import 'package:flutter/material.dart';
import 'package:flutter_app_signup_2/HomePage.dart';
import 'package:flutter_app_signup_2/SignUp.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_signup_2/Login.dart';
import 'package:flutter_app_signup_2/Start.dart';
import 'dart:ui';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black ,
        scaffoldBackgroundColor: Colors.deepOrange[100],

        textTheme: TextTheme(
          // ignore: deprecated_member_use
          display1: TextStyle(color: Colors.indigo[900] ,fontWeight: FontWeight.bold),
          button: TextStyle(color: Colors.white),
          // ignore: deprecated_member_use
          headline:TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),


      home: Homepage(),

      routes: <String,WidgetBuilder>
      {
        "Login": (BuildContext context)=>Login(),
        "SignUp": (BuildContext context)=>SignUp(),
        "Start": (BuildContext context)=>Start(),

      },
    );
  }
}


