import 'package:flutter/material.dart';

class CurrentIndexProvider extends ChangeNotifier{
  var currentIndex = 0;

  changeIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

}