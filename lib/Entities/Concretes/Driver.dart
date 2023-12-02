import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';

class Driver extends AbstractUser{
  String? _shuttleCode;

  void set shuttleCode(String? shutlleCode){
    this._shuttleCode=shutlleCode;
  }

  String? get shuttleCode{
    return this._shuttleCode;
  }
}