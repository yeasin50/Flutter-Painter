import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants.dart';

class MenuItems {
  static Future<void> saveImage() async {
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
        quality: 60,
        isReturnImagePathOfIOS: true,
        name: "canvas_Img");
    print(result.toString());
  }
}
