import 'package:flutter/material.dart';
import 'package:health_management_bottomnavigation_design/service/doctor.dart';
import 'package:health_management_bottomnavigation_design/service/icu.dart';
import 'package:health_management_bottomnavigation_design/service/mainpage.dart';
import 'package:health_management_bottomnavigation_design/service/medicine.dart';
import 'package:health_management_bottomnavigation_design/service/sidebar.dart';
import 'package:health_management_bottomnavigation_design/service/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title,});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myindex = 0;



  static const PrimaryColor =  Color(0xFF6ED969);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Sidebar(),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


String getCurrentTime() {
  DateTime now = DateTime.now();
  return DateFormat('hh:mm:ss, d-MMM, EEE ').format(now);
}




