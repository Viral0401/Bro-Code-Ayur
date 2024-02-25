
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  String title="";
  String description="";
  void setData(String title, String description){
    title=title;
    description=description;
    notifyListeners();
  }
  get getTitle=>title;
  get getDescription=>description;
}