// import 'main.dart'; // If main.dart is already imported in main.dart, you don't need to import it again.

import 'package:flutter/material.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/Controller/Concretes/Parent/ParentLogInController.dart';
import 'package:mobile_dev/Pages/Home/HomePage.dart';
import 'package:mobile_dev/Pages/Parent/ParentBase.dart';

class LogInParent extends StatelessWidget {
  InputController inputController=InputController();
  ParentLogInController parentLogInController = ParentLogInController();

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
                  "Login Parent",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    errorText: parentLogInController.errorMessage,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async{
                    setState() {
                        parentLogInController.errorMessage=null;
                    };

                    if(await parentLogInController.logIn(inputController)){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                      );
                    }
                    else{
                      setState() {
                        parentLogInController.errorMessage="Invalid number or password!";
                      };
                    }

                  },
                  child: Text("Sign-In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
