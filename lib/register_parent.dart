// add_child.dart
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ParentRegister extends StatelessWidget {
  // Boş bir dropdown değeri
  String? selectedSchool;
  TextEditingController shuttleCodeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Parent-Sign Up",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Tc id",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Get the value from the "Name" input field
                    String shuttlecode = shuttleCodeController.text;

                    // TODO: Add Firebase logic to push the "Name" value to the database
                    FirebaseFirestore.instance.collection('Parents').add({
                      'shuttleCode': shuttlecode,
                      // Add other fields as needed
                    });

                    // Additional logic or navigation can be added here

                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
