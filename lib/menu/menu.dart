import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:paintApp/drawhelper/drawingArea.dart';
import 'package:paintApp/main.dart';

import '../customPainter.dart';

class MenuItems {
  PictureRecorder recorder = new PictureRecorder();
  static void saveImage() async {
    print("Save called");
    Canvas canvas = MyCustomPainter().getCanvas;
    final points = MyCustomPainter().getPoints;
    final picture = MyCustomPainter().getRecoder.endRecording();
    final img = await picture.toImage(200, 200);
    final pngBytes = await img.toByteData(format: ImageByteFormat.png);
    new Image.memory(new Uint8List.view(pngBytes.buffer));
  }
}
