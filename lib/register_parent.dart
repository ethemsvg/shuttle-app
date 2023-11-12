// add_child.dart
import 'main.dart';

import 'package:flutter/material.dart';

class ParentRegister extends StatelessWidget {
  // Boş bir dropdown değeri
  String? selectedSchool;
  TextEditingController shuttleCodeController = TextEditingController();

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
                  onPressed: () {
                    /////////////////////
                    //////////////////////////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////


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
