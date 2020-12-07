import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Const{
  static GlobalKey globalKeyOfSaving;
}
class BasicDB with ChangeNotifier {
  BasicDB() {}
  
  bool _isAntiAlias = false;
  StrokeCap _selectedCap = StrokeCap.round;
  int _renderQuality = 6;

  get isAntiAlias => _isAntiAlias;
  get renderQuality => _renderQuality;
  get strokeCap => _selectedCap;


  void changeAntiAlias() {
    _isAntiAlias = !isAntiAlias;
    notifyListeners();
  }

  
  void increaseRenderQuality() {
    if (_renderQuality > 8) {
      _renderQuality = 1;
    } else {
      _renderQuality += 1;
    }
    notifyListeners();
  }

  void gShowDialog(BuildContext context, List<Widget> childrens) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );
  }

  set strokeCap(StrokeCap type) {
    _selectedCap = type;
    notifyListeners();
  }
}
