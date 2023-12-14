import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Hostess.dart';

class HostessController extends AbstractController{

  Hostess hostess = Hostess();
  MyFirebase myFirebase=MyFirebase();

  Future<bool> register(InputController inputController, FormState formState) async{
    // Get the values from the text field controllers
    String name = inputController.nameController.text;
    String surname = inputController.surnameController.text;
    String phoneNumber = inputController.phoneNumberController.text;
    String shuttleKey = inputController.shuttleCodeController.text;
    String password = inputController.passwordController.text;  // Assuming you have a passwordController

    // Check if all validations pass
    if (formState.validate()) {
      // Assign the values to your hostess object
     /* hostess.name = name;
      hostess.surname = surname;
      hostess.phoneNumber = phoneNumber;
      hostess.shuttleKey = shuttleKey;

      // Add the Parent object to Firestore
      await FirebaseFirestore.instance.collection('Hostess').add({
        'name': hostess.name,
        'surname': hostess.surname,
        'phoneNumber': hostess.phoneNumber,
        'shuttleCode': hostess.shuttleKey,
        // 'students': null, // Uncomment if you need to add this field
      });*/
      return true;
    }
      return false;
      // Handle the validation failure (e.g., show an error message)

  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Name must contain only letters';
    }
    return null;
  }

  String? validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Surname cannot be empty';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Surname must contain only letters';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (!RegExp(r'^05\d{9}$').hasMatch(value)) {
      return 'Phone number must start with 05 and be 11 digits long';
    }
    return null;
  }


  String? validateShuttleKey(String? value) {
    if (value == null || value.isEmpty) {
      return 'Shuttle key cannot be empty';
    }
    // Add additional pattern matching if your shuttle key has a specific format
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
    }
    return null;
  }






}