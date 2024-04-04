// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phcontroller = TextEditingController();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomeScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phcontroller,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                collectionReference.add(
                    {"name": namecontroller.text, "ph": phcontroller.text});
                namecontroller.clear();
                phcontroller.clear();
              },
              child: Text("Add"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                  stream: collectionReference.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot studentsnap =
                              snapshot.data!.docs[index];
                          return ListTile(
                            title: Text(studentsnap["name"]),
                            subtitle: Text(studentsnap["ph"]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    collectionReference
                                        .doc(studentsnap.id)
                                        .set({
                                      "name": namecontroller.text,
                                      "ph": phcontroller.text
                                    });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                    onPressed: () {
                                      collectionReference
                                          .doc(studentsnap.id)
                                          .delete();
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
