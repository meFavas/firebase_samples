// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:drawer_samples/view/regscreen/regscreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Regscreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT678AMQGawW_BkIgfH_jTqvhIdX5BzCR-wlw&s"),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              "FireBase",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
