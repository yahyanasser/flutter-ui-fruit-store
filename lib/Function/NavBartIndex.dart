import 'package:flutter/cupertino.dart';

class NavBarIndex extends ChangeNotifier {
  int currentIndex=0;
setindex(tab){
  currentIndex=tab;
  notifyListeners();
}

  
}