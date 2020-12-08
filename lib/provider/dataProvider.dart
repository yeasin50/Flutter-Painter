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

  Future<void> saveDrawing(String drawName, BuildContext context) async {
    final provider = Provider.of<BasicDB>(context);
    final _key = Constants.globalKey;
    // checking storage permission
    if (!(await Permission.storage.status.isGranted)) {
      await Permission.storage.request();
    }
    // print("Save called");
    RenderRepaintBoundary boundary = _key.currentContext.findRenderObject();

    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    // print("empty File " + pngBytes.isEmpty.toString());
    // FIXME:: failed to save
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: provider.renderQuality * 10 + 10,
        isReturnImagePathOfIOS: true,
        name: drawName);
    log("render Quality: " +
        (provider.renderQuality * 10 + 10).toString() +
        result.toString());

    if (result["isSuccess"]) {
      Navigator.of(context).pop();
      log("save loc for future uses");
    }
  }
}
