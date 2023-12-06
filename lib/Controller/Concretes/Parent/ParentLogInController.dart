import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class ParentLogInController extends AbstractController{
  MyFirebase myFirebase=MyFirebase();
  Parent parent=Parent();

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

  Future<bool> isValidNumber(String phoneNumber, String password) async {
    try {
       myFirebase.querySnapshot = await FirebaseFirestore.instance.collection('Parents')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .where('password', isEqualTo: password)
          .get();

      if(myFirebase.querySnapshot.docs.isNotEmpty){
          Map<String, dynamic> data = myFirebase.querySnapshot.docs.elementAt(0).data() as Map<String, dynamic>;
          // Assign values from Firestore document data to the fields

          parent.surname = data['surname'];
          parent.name = data['name'];
          parent.password = data['password'];
          parent.phoneNumber = data['phoneNumber'];
          parent.shuttleKey = data['shuttleCode'];
          parent.childList = data['childList'];

      }

      return myFirebase.querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error: $e");
      return false;
    }

  }

}