import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static GlobalKey globalKey;
  static Uint8List tempImg;
  static bool isAntiAlias = false;

  // static get getStrokeCap(){}
  static gShowDialog(BuildContext context, List<Widget> childrens) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );
  }
}
