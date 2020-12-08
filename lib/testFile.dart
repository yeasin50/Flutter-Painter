import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:paintApp/test/overLayApproce.dart';
import 'package:paintApp/menu/constants.dart';
import 'package:paintApp/widget/SaveDialogContent.dart';
import 'package:permission_handler/permission_handler.dart';

class TestDemo extends StatefulWidget {
  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // _requestPermission();
  }

  loadDialoag(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("A"),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  TextField(),
                ],
              ),
            ),
            actions: [],
          );
        });
  }

  var selection;
  var selectedItem = 1;
  int count = 0;

  List<Icon> icons = [
    Icon(Icons.home),
    Icon(Icons.ac_unit),
    Icon(Icons.unfold_less),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save image to gallery"),
      ),
      // body: buildCenterSave(context),

      body: Center(
          //sideMenu SelectionBar
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
          ),
        ),
        child: Text('Flutter in the sky', textAlign: TextAlign.center),
      )),
    );
  }
}

///```
/// Cool looks 😋
//  FlatButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         // topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                       ),
//                       side: BorderSide(color: Colors.red, width: 7),
//                     ),
//                     // shape: StadiumBorder(),
//                     color: Colors.blue,
//                     child: Text(count.toString()),
//                     onPressed: () {
//                       setState(() {
//                         if (count > 9)
//                           count = 0;
//                         else
//                           count += 1;
//                       });
//                     },
//                   ),

// Center buildCenterPush(BuildContext context, Uint8List imgData) {
//   return Center(
//     child: RaisedButton(
//       onPressed: () => Navigator.push(
//           context,
//           new MaterialPageRoute(
//             builder: (BuildContext context) => FullScreenDialog(),
//             fullscreenDialog: true,
//           )),
//       child: Text("Clicky"),
//     ),
//   );
// }

//   Center buildCenterSave(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           RepaintBoundary(
//             key: _globalKey,
//             child: Container(
//               width: 200,
//               height: 200,
//               color: Colors.red,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 15),
//             child: RaisedButton(
//               onPressed: () => _saveScreen(context),
//               child: Text("Save Local Image"),
//             ),
//             width: 200,
//             height: 44,
//           ),
//         ],
//       ),
//     );
//   }

//   _requestPermission() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     final info = statuses[Permission.storage].toString();
//     print(info);
//     // _toastInfo(info);
//   }

//   _saveScreen(BuildContext context) async {
//     RenderRepaintBoundary boundary =
//         _globalKey.currentContext.findRenderObject();

//     ui.Image image = await boundary.toImage();
//     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData.buffer.asUint8List();
//     Constants.tempImg = pngBytes;
//     // print("empty File " + pngBytes.isEmpty.toString());
//     // //
//     // final result = await ImageGallerySaver.saveImage(
//     //   pngBytes,
//     //   quality: 60,
//     //   name: "canvas_Img",
//     // );

//     // print(result.toString());
//     buildCenterPush(context, pngBytes);
//   }
// }
