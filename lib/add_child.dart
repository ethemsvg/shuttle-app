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
                      "Add Child",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Child Name and Surname TextField
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
                          labelText: "Child Name and Surname",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Tc id TextField
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
                          labelText: "Phone Number",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Parent Phone TextField
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
                          labelText: "Parent Phone",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Boş DropdownButton
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                          // ... (your dropdown items)
                        ],
                        style: TextStyle(
                          fontSize: 16.0, // DropdownButton text font size
                          color: Colors.black,
                        ),
                        underline: SizedBox(), // Remove default underline
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Shuttle Code TextField
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
                          labelText: "Shuttle Code",
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Elevated Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 40.0), // Adjusted the width
                      child: ElevatedButton(
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
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF66BB82), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Button border radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Add Child", style: TextStyle(fontSize: 16)),
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
