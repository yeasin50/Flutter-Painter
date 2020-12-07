import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shapes with ChangeNotifier {
  Shapes() {}
  bool _isRectangale = false;
  Color _selectedColor = Colors.black;
  bool _fillShape = false;

  void updateRact() {
    _isRectangale = !_isRectangale;
    notifyListeners();
  }

  set selectedColor(Color color) => _selectedColor = color;
  void updateFillShape() => _fillShape = !_fillShape;

  Color get selectedColor => _selectedColor;
  bool get fillShape => _fillShape;
  bool get isRectangle => _isRectangale;
}
