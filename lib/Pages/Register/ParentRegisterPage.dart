import 'package:flutter/material.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/Controller/Concretes/Parent/ParentController.dart';
import '../LogIn/ParentLoginPage.dart';

class ParentRegister extends StatefulWidget {
  @override
  _HostesRegisterState createState() => _HostesRegisterState();
}

class _HostesRegisterState extends State<ParentRegister> {
  bool _isObscured = true;
  bool _isObscured_ = true;

  ParentController parentRegisterController = ParentController();
  InputController inputController = InputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Parent Sign-Up",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Name",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.surnameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Surname",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.phoneNumberController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter phone number",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: inputController.shuttleCodeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Shuttle Code",
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          obscureText: _isObscured,
                          controller: inputController.passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          obscureText: _isObscured_,
                          controller:
                          inputController.confirmpasswordController,
                          validator: (value) {
                            if (value !=
                                inputController.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured_
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscured_ = !_isObscured_;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (await parentRegisterController.register(
                              inputController, _formKey.currentState!)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInParent(),
                              ),
                            );
                          }
                        },
                        child: Text("Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
