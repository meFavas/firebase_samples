// ignore_for_file: prefer_const_constructors

import 'package:drawer_samples/view/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LoginScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.grey,
                  filled: true),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.grey,
                  filled: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(),
                    ));
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
