// import 'main.dart'; // If main.dart is already imported in main.dart, you don't need to import it again.

import 'package:flutter/material.dart';

class LoginParent extends StatelessWidget {
  TextEditingController tcIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  controller: tcIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Tc ID",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform sign-in logic using the entered TC ID and Password
                    //
                    //
                    // Perform sign-in logic using the entered TC ID and Password
                    //
                    //
                    // Perform sign-in logic using the entered TC ID and Password
                    //
                    //
                    // Perform sign-in logic using the entered TC ID and Password
                    //
                    //
                    // Perform sign-in logic using the entered TC ID and Password
                    //
                    //

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
