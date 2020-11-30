import 'dart:ui';

import 'package:flutter/material.dart';

import 'drawhelper/drawingArea.dart';

class MyCustomPainter extends CustomPainter {
  List<DrawingArea> points;
  Canvas _Canvas;
  final recoder = new PictureRecorder();

  MyCustomPainter({
    this.points,
  });

  Canvas get getCanvas {
    return _Canvas;
  }

  get getPoints {
    return points;
  }

  get getRecoder {
    return recoder;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //save here

    _Canvas = new Canvas(recoder);

    // main backGround
    Paint bg = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, bg);

    // we are checking if there is just one click
    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(
            points[x].point, points[x + 1].point, points[x].areaPaint);
      }
      //single touch Point
      else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(
            PointMode.points, [points[x].point], points[x].areaPaint);
      }
    }
    //To save canvas
    _Canvas = canvas;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
