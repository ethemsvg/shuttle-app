import 'package:mobile_dev/Entities/Abstract/AbstractUser.dart';
import 'package:mobile_dev/Entities/Concretes/Children.dart';

class Hostess extends AbstractUser{
  String? _shuttleKey;
  late List<Children> _child_list;

  void set shuttleKey(String? shuttleKey){
    this.shuttleKey=shuttleKey;
  }

  String? get shuttleKey{
    return this.shuttleKey;
  }

  void set childList(List<Children> childList){
    this.childList=childList;
  }

  List<Children> get childList{
    return this.childList;
  }

}