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
        body: Stack(
          children: [
            // Background Image
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                'assets/output_image.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),

            // Gradient Background
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Color(0xDBFFFBFB),
                      Color(0xF1C6B8C6),
                      Color(0xF3D8D6C2),
                      Color(0xFFDBCFC4),
                    ],
                    stops: [0.0, 0.2, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Content
            Center(
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
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // TC ID TextField
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: tcIdController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter Phone number",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Password TextField
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter Password",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Elevated Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: ElevatedButton(
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
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF66BB82), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Button border radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sign-In", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
