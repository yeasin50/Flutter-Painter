import 'dart:math';
import 'package:flutter/material.dart';
import 'package:paintApp/widget/FixedPackage.dart/constants.dart';
import 'package:paintApp/widget/SaveDialogContent.dart';
import 'menuHandler.dart';

class MenuHolder extends StatefulWidget {
  @override
  _MenuHolderState createState() => _MenuHolderState();
}

class _MenuHolderState extends State<MenuHolder> {
  final errMsg = "Please name your Drawing before save";
  nevigateToSave() {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => FullScreenDialog(),
          fullscreenDialog: true,
        ));
  }

  bool validateName(String value) {
    if (value.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(errMsg)));
      return false;
    }
    return true;
  }

  void getName(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("File Name"),
              content: TextFormField(
                controller: controller,
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: "Home",
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                FlatButton(
                  // onPressed: () => MenuItems.saveImage(),
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    if (validateName(controller.text)) {
                      MenuItems.saveImage(controller.text, context);
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ));
  }

  /// ```
  /// stroke cap
  /// ```
  var selectedStrokeCap = 1;
  final List<Image> strokeCapimages = [
    Image.asset(
      "assets/images/strokeCap/butt.png",
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      "assets/images/strokeCap/round.png",
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      "assets/images/strokeCap/square.png",
      fit: BoxFit.fitWidth,
    ),
  ];
  List<Icon> icons = [
    Icon(Icons.home),
    Icon(Icons.ac_unit),
    Icon(Icons.unfold_less),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10,
        ),
        //Save pic
        Tooltip(
          message: "save",
          child: IconButton(
            icon: Icon(Icons.save),
            onPressed: () => getName(context),
          ),
        ),
        //Quality Save pic
        Tooltip(
          message: "Saving Quality",
          child: FlatButton(
            child: Text(
              ((Constants.renderQuality)).toString(),
              style: TextStyle(),
            ),
            onPressed: () => {
              setState(() {
                Constants.increaseRenderQuality();
              })
            },
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.black,
          endIndent: 2,
          indent: 2,
        ),
        //isAntiAlias
        Tooltip(
          message: "isAntiAlias",
          child: IconButton(
            padding: EdgeInsets.all(0),
            // iconSize: 23,
            icon: Constants.isAntiAlias
                ? Image.asset(
                    "assets/images/antiAlise/antiAliseOn.png",
                    width: 40,
                    fit: BoxFit.fitWidth,
                  )
                : Image.asset(
                    "assets/images/antiAlise/antiAliseOff.png",
                    fit: BoxFit.fitWidth,
                  ),
            onPressed: () {
              setState(() {
                Constants.isAntiAlias = !Constants.isAntiAlias;
                // log(Constants.isAntiAlias.toString());
              });
            },
          ),
        ),

        //Strockecap
        Tooltip(
          message: "StrokeCap",
          child: Transform.rotate(
            angle: pi / 2,
            child: DropdownButton(
              // isExpanded: true,
              // dropdownColor: Colors.red,
              // isDense: true,
              iconSize: 0,
              underline: Container(),
              onChanged: (value) {
                setState(() {
                  selectedStrokeCap = value;
                  switch (value) {
                    case 1:
                      Constants.setStrokeType(StrokeCap.butt);
                      break;
                    case 2:
                      Constants.setStrokeType(StrokeCap.round);
                      break;
                    case 3:
                      Constants.setStrokeType(StrokeCap.square);
                      break;
                  }
                });

                print("Stroke Cap " + selectedStrokeCap.toString());
              },
              value: selectedStrokeCap,
              items: [
                DropdownMenuItem(
                  child: strokeCapimages[0],
                  value: 1,
                ),
                DropdownMenuItem(
                  child: strokeCapimages[1],
                  value: 2,
                ),
                DropdownMenuItem(
                  child: strokeCapimages[2],
                  value: 3,
                ),
              ],
            ),
          ),
        ),

        //anitiAlise
        Tooltip(
          message: "AntiAlias",
          child: IconButton(
            icon: Icon(Icons.clear_all_rounded),
            onPressed: () {},
          ),
        ),
        //BlandeMode

        IconButton(
          icon: Icon(Icons.model_training),
          onPressed: () {},
        ),

        Divider(
          thickness: 2,
          color: Colors.black,
          endIndent: 2,
          indent: 2,
        ),

        IconButton(
          icon: Icon(Icons.zoom_out_map_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
