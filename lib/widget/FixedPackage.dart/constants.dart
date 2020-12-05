import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static GlobalKey globalKey;
  static Uint8List tempImg;
  static bool isAntiAlias = false;
  static StrokeCap selectedCap = StrokeCap.round;
  static int renderQuality = 6;

  static increaseRenderQuality() {
    if (renderQuality > 8) {
      renderQuality = 1;
    } else {
      renderQuality += 1;
    }
  }

  // static get getStrokeCap(){}
  static gShowDialog(BuildContext context, List<Widget> childrens) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );
  }

  static setStrokeType(StrokeCap type) {
    if (type == null) {
      return;
    }
    selectedCap = type;
  }
}
