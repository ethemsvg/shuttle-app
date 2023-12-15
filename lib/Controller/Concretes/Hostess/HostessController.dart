import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Hostess.dart';

class HostessController extends AbstractController{

  static Hostess hostess = Hostess();
  MyFirebase myFirebase=MyFirebase();

  Future<bool> logIn(InputController inputController) async {
    var phoneNumber = inputController.phoneNumberController.text;
    var password = inputController.passwordController.text;

    if (await checkExistForLogIn(phoneNumber, password)) {
      return true;
    } else {
      super.errorMessage = "Invalid phone number or password!";
    }
    return false;
  }

  Future<bool> checkExistForLogIn(String phoneNumber, String password) async {
    try {
        print("phoneNumber: "+phoneNumber);
      myFirebase.querySnapshot = await FirebaseFirestore.instance
          .collection('Hostess')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .where('password', isEqualTo: password)
          .get();

      if (myFirebase.querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> data = myFirebase.querySnapshot.docs
            .elementAt(0)
            .data() as Map<String, dynamic>;
        // Assign values from Firestore document data to the fields

        hostess.surname = data['surname'];
        hostess.name = data['name'];
        hostess.password = data['password'];
        hostess.phoneNumber = data['phoneNumber'];
        hostess.students = data['students'];
      }

      return myFirebase.querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<bool> register(InputController inputController, FormState formState) async {
    if (formState.validate())
    {
      if (await checkExistForRegister(inputController.phoneNumberController.text))
      {
        // Get the values from the text field controllers
        hostess.name = inputController.nameController.text;
        hostess.surname = inputController.surnameController.text;
        hostess.phoneNumber = inputController.phoneNumberController.text;
        hostess.password = inputController.passwordController.text;
        // Add the Parent object to Firestore
        await FirebaseFirestore.instance.collection('Hostess').add({
          'name': hostess.name,
          'surname': hostess.surname,
          'phoneNumber': hostess.phoneNumber,
          'password': hostess.password,
          'students': [],
        });
      }
      else
      {
        print("NUMBER IS BEING USED BY ANOTHER USER");
        return false;
      }
      return true;
    }
    return false;
  }

  Future<bool> checkExistForRegister(String phoneNumber) async {
    try {
      myFirebase.querySnapshot = await FirebaseFirestore.instance
          .collection('Hostess')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (myFirebase.querySnapshot.docs.isNotEmpty) {
        return false;
      }

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }





}