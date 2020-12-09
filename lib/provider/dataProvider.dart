import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:paintApp/menu/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'dart:ui' as ui;
// class Const {
//   static GlobalKey globalKeyOfSaving;
// }

class BasicDB with ChangeNotifier {
  BasicDB() {}

  bool _isAntiAlias = false;
  StrokeCap _strokeCap = StrokeCap.round;
  // GlobalKey _globalKeyOfSaving;
  int _renderQuality = 6;

  // get globalKeyOfSaving => _globalKeyOfSaving;
  get isAntiAlias => _isAntiAlias;
  get renderQuality => _renderQuality;
  get strokeCap => _strokeCap;

  // set globalKeyOfSaving(GlobalKey key) {
  //   // this._globalKeyOfSaving = key;
  //   print(key.toString());
  //   notifyListeners();
  // }

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

  void changeStrokeCap() {
    if (_strokeCap == StrokeCap.round) {
      _strokeCap = StrokeCap.square;
    } else if (_strokeCap == StrokeCap.square) {
      _strokeCap = StrokeCap.butt;
    } else if (_strokeCap == StrokeCap.butt) {
      _strokeCap = StrokeCap.round;
    }

    notifyListeners();
  }

  ///TODO:: save pic

}
