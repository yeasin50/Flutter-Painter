import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paintApp/widget/FixedPackage.dart/constants.dart';
import 'package:paintApp/widget/SaveDialogContent.dart';
import 'menuHandler.dart';

class MenuHolder extends StatefulWidget {
  @override
  _MenuHolderState createState() => _MenuHolderState();
}
// enum strokeType{
    
//   }
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
                      log("Save Now");
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

  
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: IconButton(
            icon: Icon(Icons.high_quality),
            onPressed: () => {},
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.black,
          endIndent: 2,
          indent: 2,
        ),
        //Strockecap
        Tooltip(
          message: "BlendMode",
          child: IconButton(
            icon:
                Constants.isAntiAlias ? Icon(Icons.star) : Icon(Icons.star_outline),
            onPressed: () {
              setState(() {
                Constants.isAntiAlias = !Constants.isAntiAlias;
                log(Constants.isAntiAlias.toString());
              });
            },
          ),
        ),
       
        //Strockecap
        Tooltip(
          message: "StrokeCap",
          child: IconButton(
            icon: Icon(Icons.rounded_corner),
            onPressed: () {},
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
