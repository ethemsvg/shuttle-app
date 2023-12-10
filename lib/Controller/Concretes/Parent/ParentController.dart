import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Children.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class ParentController extends AbstractController{
  MyFirebase myFirebase=MyFirebase();
  static Parent parent=Parent();
  Children children=Children();

  Future<bool> logIn(InputController inputController) async{
    var phoneNumber=inputController.phoneNumberController.text;
    var password=inputController.passwordController.text;

    if(await checkExistForLogIn(phoneNumber,password)){
      return true;
    }
    else{
      super.errorMessage="Invalid phone number or password!";
    }
    return false;
  }

  Future<bool> checkExistForLogIn(String phoneNumber, String password) async {
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

  Future<bool> register(InputController inputController) async{

    if(await checkExistForRegister(inputController.phoneNumberController.text)){
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
      print("NUMBER IS BEING USED BY ANOTHER USER");
      return false;
    }
    return true;
  }

  Future<bool> checkExistForRegister(String phoneNumber) async {
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



  Future<bool> addChild(InputController inputController, String? selectedSchool) async{
    try{
      myFirebase.querySnapshot = await FirebaseFirestore.instance.collection('Shuttle')
          .where('shuttleKey', isEqualTo: inputController.shuttleCodeController.text)
          .get();
      if(myFirebase.querySnapshot.docs.isEmpty){
        return false;
      }

      children.name=inputController.nameController.text;
      children.surname=inputController.surnameController.text;
      children.shuttleKey=inputController.shuttleCodeController.text;
      children.school.school_name=selectedSchool;
      children.phoneNumber=parent.phoneNumber;
      children.birthDate=inputController.birthDateController.text;
      children.key=children.hashTcID(inputController.birthDateController.text);
      parent.childList.add(children.key);

      addChildToDB(inputController,selectedSchool);
      addChildToParentDB();
      addChildToShuttleDB();
      addChildToHostessDB();
    }catch(e){
      print("Error: $e");
      return false;
    }

    return true;
  }


  Future<void> addChildToDB(InputController inputController,String? selectedSchool) async{
      await FirebaseFirestore.instance.collection('Children')
          .add({
          'name': inputController.nameController.text,
          'surname': inputController.surnameController.text,
          'shuttleKey': inputController.shuttleCodeController.text,
          'school_name': selectedSchool,
          'parent_phone_number': parent.phoneNumber,
          'birthDate': inputController.birthDateController.text,
          'key': children.key,
      });
  }

  Future<void> addChildToHostessDB() async{
    myFirebase.querySnapshot= await FirebaseFirestore.instance.collection('Hostess')
        .where('shuttleKey', isEqualTo: children.shuttleKey)
        .get();

    var docID=myFirebase.querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('Hostess').doc(docID)
        .update({
      'childList': FieldValue.arrayUnion([children.key])
    });
  }

  Future<void> addChildToShuttleDB() async{
    myFirebase.querySnapshot= await FirebaseFirestore.instance.collection('Shuttle')
        .where('shuttleKey', isEqualTo: children.shuttleKey)
        .get();

    var docID=myFirebase.querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('Shuttle').doc(docID)
    .update({
      'childList': FieldValue.arrayUnion([children.key])
    });
  }
  
  Future<void> addChildToParentDB() async{
    myFirebase.querySnapshot=await FirebaseFirestore.instance.collection('Parents')
        .where('phoneNumber', isEqualTo: parent.phoneNumber)
        .get();

    var docID=myFirebase.querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('Parents').doc(docID).update(
        {'childList': FieldValue.arrayUnion([children.key])
        });
  }

}