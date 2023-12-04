import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class ParentLogInController extends AbstractController{
  MyFirebase myFirebase=MyFirebase();
  Parent parent = Parent();

  Future<bool> logIn(InputController inputController) async{
    var phoneNumber=inputController.phoneNumberController.text;
    var password=inputController.passwordController.text;

    if(await isValidNumber(phoneNumber,password)){
      return true;
    }
    else{
      super.errorMessage="Invalid phone number or password!";
    }
    return false;
  }

  Future<bool> isValidNumber(String phoneNumber, String shuttleKey) async {
    try {
       myFirebase.querySnapshot = await FirebaseFirestore.instance.collection('Parents')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .where('shuttleCode', isEqualTo: shuttleKey)
          .get();

      if(myFirebase.querySnapshot.docs.isNotEmpty){
          print("phoneNumber: "+phoneNumber);
          print("shuttleCode: "+shuttleKey);
      }

      return myFirebase.querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error: $e");
      return false;
    }

  }

}