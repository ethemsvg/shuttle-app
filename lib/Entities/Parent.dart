import 'package:mobile_dev/Entities/AbstractUser.dart';

import 'Children.dart';

class Parent extends AbstractUser{
  String?  phoneNumber;
  String? shuttle_key;
  late List<Children> childList;
}