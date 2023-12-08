import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Hostess.dart';

class HostessController extends AbstractController{

  Hostess hostess = Hostess();
  MyFirebase myFirebase=MyFirebase();

  void register(InputController inputController) async{

    // Get the values from the text field controllers
    hostess.name = inputController.nameController.text;
    hostess.surname = inputController.surnameController.text;
    hostess.phoneNumber = inputController.phoneNumberController.text;
    hostess.shuttleKey = inputController.shuttleCodeController.text;

    // Add the Parent object to Firestore
    await FirebaseFirestore.instance.collection('Hostess').add({
      'name': hostess.name,
      'surname': hostess.surname,
      'phoneNumber': hostess.phoneNumber,
      'shuttleCode': hostess.shuttleKey,
      'students':null,
    });
  }
}