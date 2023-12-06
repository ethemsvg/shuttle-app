import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class ParentRegisterController extends AbstractController{

  Parent parent=Parent();
  MyFirebase myFirebase=MyFirebase();

  Future<bool> register(InputController inputController) async{

    if(await isValidNumber(inputController.phoneNumberController.text)){
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
        'password': parent.password,
        'childList': parent.childList,
      });
    }
    else{
      print("NUMBER IS USING BY ANOTHER USER");
      return false;
    }
      return true;
  }

  Future<bool> isValidNumber(String phoneNumber) async {
    try {
      myFirebase.querySnapshot = await FirebaseFirestore.instance.collection('Parents')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if(myFirebase.querySnapshot.docs.isNotEmpty){
        return false;
      }

      return true;

    } catch (e) {
      print("Error: $e");
      return false;
    }

  }
}