import 'dart:ui';

class DrawingArea {
  Offset point;
  Paint areaPaint;
  DrawingArea({this.point, this.areaPaint});
}

class SavedFile {
  String name;
  String filePath;
  DateTime time;

  SavedFile({this.name, this.filePath, this.time});
}
