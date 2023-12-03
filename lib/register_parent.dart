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
                      "Parent-Sign Up",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Name TextField
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter Name",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Surname TextField
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter Surname",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Phone Number TextField
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
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter Phone Number",
                        ),
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
                        controller: shuttleCodeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Enter TC ID",
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
                          /////////////////////
                          //////////////////////////////////////////
                          /////////////////////
                          /////////////////////
                          /////////////////////
                          /////////////////////
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF66BB82), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Button border radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Register", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // KidCruiser Version Text
                    Text(
                      'KidCruiser\nVersion 1.0.0\n Order 227 Team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
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
