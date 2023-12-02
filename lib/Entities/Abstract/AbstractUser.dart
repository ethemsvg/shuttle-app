abstract class AbstractUser {
  String? _name;
  String? _surname;
  String? _phone_number;

  String? get name{
    return _name;
  }

  set name(String? value) {
    _name = value;
  }

  String? get surname{
    return _surname;
  }

  set surname(String? value){
    _surname = value;
  }

  String? get phoneNumber{
    return _phone_number;
  }

  set phoneNumber(String? value){
    _phone_number = value;
  }
}
