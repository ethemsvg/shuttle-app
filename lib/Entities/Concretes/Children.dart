import 'dart:math';

import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'package:mobile_dev/Entities/Concretes/School.dart';

class Children extends AbstractUser{
  School _school=School();
  String? _shuttleKey;
  String _key="";

  String generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random.secure();
    return List.generate(length, (_) => characters[random.nextInt(characters.length)]).join();
  }

  Children(){
    this._key=generateRandomString(8);
  }

  String get key{
    return this._key;
  }

  School get school{
    return this._school;
  }

  void set school(School school){
    this._school=school;
  }

  String? get shuttleKey{
    return this._shuttleKey;
  }

  void set shuttleKey(String? shuttleKey){
    this._shuttleKey=shuttleKey;
  }

}