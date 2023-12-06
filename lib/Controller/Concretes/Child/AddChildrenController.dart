import 'package:mobile_dev/Controller/Abstract/AbstractController.dart';
import 'package:mobile_dev/Controller/Concretes/Input/InputController.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Children.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';

class AddChildrenController extends AbstractController{
  MyFirebase myFirebase=MyFirebase();
  Children children=Children();

  void addChild(InputController inputController, Parent parent){
  }
}