import 'package:mobile_dev/Controller/Concretes/Hostess/HostessController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:flutter/material.dart';

import '../LogIn/HostessLoginPage.dart';

class HostesRegister extends StatefulWidget {
  @override
  _HostesRegisterState createState() => _HostesRegisterState();
}

class _HostesRegisterState extends State<HostesRegister> {
  bool _isObscured = true;
  bool _isObscured_ = true;

  HostessController hostessRegisterController=HostessController();
  InputController inputController=InputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hostess Sign-Up",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: inputController.nameController,
                      validator:hostessRegisterController.validateName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Name",
                        helperText: "Name must contains only letter",
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: inputController.surnameController,
                      validator:hostessRegisterController.validateSurname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Surname",
                        helperText: "Surname must contains only letter",
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: inputController.phoneNumberController,
                      validator:hostessRegisterController.validatePhoneNumber,
                      keyboardType: TextInputType.datetime,
                      //initialValue: "05",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        helperText: "0-(5xx)-xxx-xxxx",
                       // hintText: "0(5__) - ___ - ____",
                        labelText: "Enter phone number",
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: true,
                      controller: inputController.shuttleCodeController,
                      validator:hostessRegisterController.validateShuttleKey,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Shuttle Code",
                        helperText: "Enter shuttle code that provided by the school",
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: _isObscured,
                      controller: inputController.passwordController,
                      validator:hostessRegisterController.validatePassword,
            
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Password",
                        helperText: "Password must be at least 8 characters and include \nan uppercase letter, a lowercase letter, and a digit.",
                      suffixIcon:IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: (){
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: _isObscured_,
                      controller: inputController.confirmpasswordController,
                      validator: (value) {
                        if (value != inputController.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null; // Return null if the entered password is valid
                      },
                    //keyboardType: TextInputType.,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        labelText: "Confirm Password",
                        helperText: "Re-enter your password",
                          suffixIcon:IconButton(
                            icon: Icon(
                              _isObscured_ ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                _isObscured_ = !_isObscured_;
                              });
                            },
                          )
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        if (await hostessRegisterController.register(inputController, _formKey.currentState!))
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogInHostess()),
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
        ),
      ),
    );
  }
}
