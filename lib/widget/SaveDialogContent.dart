import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:paintApp/provider/dataProvider.dart';
import 'package:paintApp/menu/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

//TODO:: checking img from cache memory
//FIXME:: load img  and show a preview of Uint8List
class FullScreenDialog extends StatefulWidget {
  String _skillOne = "You have";
  // FullScreenDialog(this.drawing);

  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  TextEditingController _skillOneController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // static Future<void> saveImage() async {
  //   final provider = Provider<BasicDB>.of(context).
  //   // final _key = Provider<BasicDB>;
  //   // checking storage permission
  //   if (!(await Permission.storage.status.isGranted)) {
  //     await Permission.storage.request();
  //   }
  //   // print("Save called");
  //   RenderRepaintBoundary boundary = _key.currentContext.findRenderObject();

  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();
  //   // print("empty File " + pngBytes.isEmpty.toString());
  //   // TODO:: Done
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(pngBytes),
  //       quality: 60,
  //       isReturnImagePathOfIOS: true,
  //       name: "canvas_Img");

  //   print(result.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Save you Creative Work ☺"),
        ),
        body: new Padding(
          child: new ListView(
            children: <Widget>[
              // new Image.memory(widget.drawing),
              SizedBox(
                height: 10,
              ),
              //TODO:: preview Image before saving
              // FutureBuilder<Uint8List>(
              //   future: saveImage(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       Image.memory(snapshot.data);
              //     }
              //   },
              // ),

              new TextField(
                controller: _skillOneController,
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new RaisedButton(
                    onPressed: () {
                      widget._skillOne = _skillOneController.text;
                      Navigator.pop(context);
                    },
                    child: new Text("Save"),
                  ))
                ],
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ));
  }
}
