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
      hostess.name = name;
      hostess.surname = surname;
      hostess.phoneNumber = phoneNumber;
      hostess.shuttleKey = shuttleKey;
      hostess.password = password;
      print("BELLI DEGIL!");

      // Add the Parent object to Firestore
      await FirebaseFirestore.instance.collection('Hostess').add({
        'name': hostess.name,
        'surname': hostess.surname,
        'phoneNumber': hostess.phoneNumber,
        'shuttleCode': hostess.shuttleKey,
        'password': hostess.password,
        'students': [],
      });
      print("BASARILI!");
      return true;
    }
      print("BASARISIZ!");
      return false;
      // Handle the validation failure (e.g., show an error message)

  }



}