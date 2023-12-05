import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'Children.dart';

class Parent extends AbstractUser {
  String? _shuttleKey;
  List<Children> _childList = [];

  Parent(){

  }

  Parent.withParameters(String? name, String? surname, String? password, String? shuttleKey, String? phoneNumber){
    super.name=name;
    super.surname=surname;
    super.password=password;
    super.phoneNumber=phoneNumber;
    this.shuttleKey=shuttleKey;
  }

  // Getter for shuttleKey
  String? get shuttleKey {
    return _shuttleKey;
  }

  // Setter for shuttleKey
  set shuttleKey(String? value) {
    _shuttleKey = value;
  }

  // Getter for childList
  List<Children> get childList {
    return _childList;
  }

  // Setter for childList
  set childList(List<Children> value) {
    _childList = value;
  }

  @override
  String toString() {
    return 'Parent { phoneNumber: $phoneNumber, surname: $surname, name: $name, shuttleCode: $shuttleKey }';
  }
}
