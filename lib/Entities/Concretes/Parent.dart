import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'Children.dart';

class Parent extends AbstractUser {
  String? _phoneNumber;
  String? _shuttleKey;
  List<Children> _childList = [];

  // Getter for phoneNumber
  String? get phoneNumber {
    return _phoneNumber;
  }

  // Setter for phoneNumber
  set phoneNumber(String? value) {
    _phoneNumber = value;
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
}
