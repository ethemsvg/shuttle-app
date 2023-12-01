// add_child.dart
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Parent {
  String name;
  String surname;
  String phoneNumber;
  String shuttleCode;

  Parent({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.shuttleCode,
  });
}

class ParentRegister extends StatelessWidget {
  // Boş bir dropdown değeri
  String? selectedSchool;
  TextEditingController shuttleCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();


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
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  controller: shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Get the values from the text field controllers
                    String name = nameController.text;
                    String surname = surnameController.text;
                    String phoneNumber = phoneNumberController.text;
                    String shuttleCode = shuttleCodeController.text;

                    // Create a Parent object
                    Parent parent = Parent(
                      name: name,
                      surname: surname,
                      phoneNumber: phoneNumber,
                      shuttleCode: shuttleCode,
                    );

                    // Add the Parent object to Firestore
                    await FirebaseFirestore.instance.collection('Parents').add({
                      'name': parent.name,
                      'surname': parent.surname,
                      'phoneNumber': parent.phoneNumber,
                      'shuttleCode': shuttleCode,
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
