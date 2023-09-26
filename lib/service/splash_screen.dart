
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/main.dart';
import 'package:health_management_bottomnavigation_design/service/bottomBar.dart';
import 'package:health_management_bottomnavigation_design/service/mainpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>BottomBar(selectedIndex: 0),));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: Text("জরুরী স্বাস্থ্যসেবায় আপনাকে স্বাগতম.",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blueGrey,letterSpacing: 2),)),
          ),
        ),
      ),
    );
  }
}
