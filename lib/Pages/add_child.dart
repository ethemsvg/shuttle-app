// add_child.dart
import '../main.dart';
// add_child.dart

// add_child.dart
import '../main.dart';
// add_child.dart

import 'package:flutter/material.dart';

class AddChildPage extends StatelessWidget {
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
                  "Add Child",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Child Name and Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tc id",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Parent Phone",
                  ),
                ),
                SizedBox(height: 16.0),
                // Boş DropdownButton
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(),
                  ),
                  child: DropdownButton<String>(
                    value: selectedSchool,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        // Seçilen okulu güncelle
                        selectedSchool = newValue;
                      }
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text("Select a School"),
                      ),
                      ...[], // Boş bir liste ekleyin
                    ],
                    style: TextStyle(
                      fontSize: 16.0, // DropdownButton text font size
                      color: Colors.black,
                    ),
                    underline: SizedBox(), // Remove default underline
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////
                    /////////////////////

                  },
                  child: Text("Add Child"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
