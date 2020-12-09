
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

class Constants {
  static GlobalKey globalKey; 
  // static bool isAntiAlias = false;
  // static StrokeCap selectedCap = StrokeCap.round;
  // static int renderQuality = 6;

  // static increaseRenderQuality() {
  //   if (renderQuality > 8) {
  //     renderQuality = 1;
  //   } else {
  //     renderQuality += 1;
  //   }
  // }

  // static get getStrokeCap(){}
  // static gShowDialog(BuildContext context, List<Widget> childrens) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(),
  //   );
  // }

  // static setStrokeType(StrokeCap type) {
  //   if (type == null) {
  //     return;
  //   }
  //   selectedCap = type;
  // }





  
  static Future<void> saveDrawing(String drawName) async {
    // final provider = Provider.of<BasicDB>(context);
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
        quality: 90,
        isReturnImagePathOfIOS: true,
        name: drawName);
    // log("render Quality: " +
    //     (provider.renderQuality * 10 + 10).toString() +
    //     result.toString());

    print("result Type:" +result.runtimeType.toString());
    // return result;
  }
}
