import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'package:mobile_dev/Entities/Concretes/Children.dart';

class Hostess extends AbstractUser{
  String? _shuttleKey;
  late List<Children> _childList;

  void set shuttleKey(String? shuttleKey){
    this._shuttleKey=shuttleKey;
  }

  String? get shuttleKey{
    return this._shuttleKey;
  }

  void set childList(List<Children> childList){
    this._childList=childList;
  }

  List<Children> get childList{
    return this._childList;
  }

}