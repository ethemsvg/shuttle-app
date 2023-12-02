import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/InputController.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class ParentRegisterController{

  void register(Parent parent, InputController inputController) async{

    // Get the values from the text field controllers
    parent.name = inputController.nameController.text;
    parent.surname = inputController.surnameController.text;
    parent.phoneNumber = inputController.phoneNumberController.text;
    parent.shuttleKey = inputController.shuttleCodeController.text;

    // Add the Parent object to Firestore
    await FirebaseFirestore.instance.collection('Parents').add({
      'name': parent.name,
      'surname': parent.surname,
      'phoneNumber': parent.phoneNumber,
      'shuttleCode': parent.shuttleKey,
    });
  }
}