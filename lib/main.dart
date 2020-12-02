import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/HomeScreen.dart';
import 'package:flutter_todo_app/screens/OnboardingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:'avenir',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds:  3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/aking.png')
            )
          ),
        ),
      ),
    );
  }
  void openOnBoard(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}




