import 'package:flutter/material.dart';

void main(){
  runApp(CheckChild());
}

class CheckChild extends StatefulWidget {
  @override
  _ParentChildListState createState() => _ParentChildListState();
}

class _ParentChildListState extends State<CheckChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Center(
          child: Stack(
            children: [

              // LOG OUT button
              Positioned(
                left: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 0.472) / 2,
                top: MediaQuery.of(context).size.height * 0.792,
                child: InkWell(
                  onTap: () {
                    // Handle LOG OUT button click
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.472,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFBBBB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.036),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text for the button
                        Text(
                          'LOG OUT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.056,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 10),  // Add some space between the logo and text
                        // Add your logo here
                        Image.asset(
                          'assets/Sign_out_circle_light.png', // Replace with the actual path to your logo
                          width: 24,  // Adjust the width as needed
                          height: 24,  // Adjust the height as needed
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // return back button
              Positioned(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.05,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF222222)),
                  onPressed: () {
                    // Return back logic
                  },
                ),
              ),

              // LOGO HEADER
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Image.asset(
                    'assets/output_image.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              ),
              // List of rows
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      // Sample row, replace with dynamic data
                      buildListRow("1", "John Doe", "EV"),
                      buildListRow("2", "Jane Doe", "OKUL"),
                      buildListRow("3", "Jack Doe", "YOLDA"),
                      buildListRow("4", "Joe Doe", "YOLDA"),
                      buildListRow("5", "Jim Doe", "YOLDA"),
                      buildListRow("6", "Jean Doe", "EV"),
                      // Add more rows as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListRow(String number, String fullName, String status) {
    Color backgroundColor;

    // Set background color based on status
    switch (status) {
      case "EV":
        backgroundColor = Color(0xFFFFB238);
        break;
      case "OKUL":
        backgroundColor = Colors.green;
        break;
      case "YOLDA":
        backgroundColor = Color(0xFF9c59b7);
        break;
      default:
        backgroundColor = Colors.white;
    }

    return Container(
      width: MediaQuery.of(context).size.width - 16, // Full width with 8 padding on each side
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    fullName,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  width: 80, // Fixed width for the status rectangle
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      status,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}