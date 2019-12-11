import 'package:flutter/material.dart';

class CurrentIndexProvider extends ChangeNotifier{
  var currentIndex;

  changeIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

}