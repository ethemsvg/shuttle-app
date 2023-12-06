// AddChildPage.dart
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/Controller/Concretes/Parent/ParentRegisterController.dart';
import 'package:flutter/material.dart';




class ParentRegister extends StatelessWidget {

  InputController inputController=InputController();
  ParentRegisterController parentRegisterController=ParentRegisterController();

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
                  controller: inputController.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  controller: inputController.shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    parentRegisterController.register(inputController);
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
