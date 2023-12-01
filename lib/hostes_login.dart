import 'package:flutter/material.dart';

class hostes_login extends StatefulWidget {
  @override
  _hostes_loginState createState() => _hostes_loginState();
}

class _hostes_loginState extends State<hostes_login> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              // Background Image
              Positioned(
                left: MediaQuery.of(context).size.width * 0.011,
                top: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset(
                  'lib/output_image.png',
                  width: MediaQuery.of(context).size.width * 0.986,
                  height: MediaQuery.of(context).size.height * 0.498,
                  
                ),
              ),

              // Sign In Button
              Positioned(
                left: MediaQuery.of(context).size.width * 0.263,
                top: MediaQuery.of(context).size.height * 0.792,
                child: InkWell(
                  onTap: () {
                    // Handle sign-in button click
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.472,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: ShapeDecoration(
                      color: Color(0xFF66BB82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.036),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Color(0xFF0C0B0B),
                          fontSize: MediaQuery.of(context).size.width * 0.056,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Input Field for ID Number
              Positioned(
                left: MediaQuery.of(context).size.width * 0.12,
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter ID Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextField(
                          controller: idController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Password Input Field
              Positioned(
                left: MediaQuery.of(context).size.width * 0.12,
                top: MediaQuery.of(context).size.height * 0.45,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.06,
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
                          ),
                        ),
                      ),
                    ],
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

              // SIGN IN HEADER
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 231,
                        child: Text(
                          'SIGN IN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF775555),
                            fontSize: 32,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Container(
                        width: 339,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
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
}
