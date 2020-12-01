import 'dart:developer';

import 'package:flutter/material.dart';
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
                      log("Save Now");
                      MenuItems.saveImage(controller.text);
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
        //set of option like shape and may others
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () => getName(context),
        ),

        IconButton(icon: Icon(Icons.circle), onPressed: () {}),
        IconButton(
          icon: Icon(Icons.zoom_in),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.zoom_out),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.zoom_out_map_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
