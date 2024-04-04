// ignore_for_file: prefer_const_constructors


import 'package:drawer_samples/view/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAcWY_yrVY7_UJUho5G94oM7V1ID2QRq4k",
          appId: "1:687479169679:android:ffabe96a431aeb8c44c6fa",
          messagingSenderId: "",
          projectId: "sample-projects-528b2",
          storageBucket: "sample-projects-528b2.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
    );
  }
}
