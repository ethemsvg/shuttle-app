import 'dart:ffi';

import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'package:mobile_dev/Entities/Concretes/Children.dart';

class Hostess extends AbstractUser{
  late List<Children> _child_list;
  String? _shuttleKey;

  void set childList(List<Children> childList){
    this.childList=childList;
  }

  List<Children> get childList{
    return this.childList;
  }

  void set shuttleKey(String? shuttleKey){
    this.shuttleKey=shuttleKey;
  }

  String? get shuttleKey{
    return this.shuttleKey;
  }
}