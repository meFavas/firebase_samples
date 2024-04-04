// ignore_for_file: prefer_const_constructors

import 'package:drawer_samples/view/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

class Regscreen extends StatelessWidget {
  const Regscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RegisterScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
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
              ElevatedButton(onPressed: () {}, child: Text("Register")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginscreen(),
                      ),
                    );
                  },
                  child: Text("login"))
            ],
          ),
        ),
      ),
    );
  }
}
