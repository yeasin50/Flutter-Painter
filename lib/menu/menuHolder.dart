import 'dart:math';
import 'package:flutter/material.dart';
import 'package:paintApp/provider/dataProvider.dart';
import 'package:paintApp/menu/constants.dart';
import 'package:paintApp/provider/shapeSelection.dart';
import 'package:paintApp/widget/SaveDialogContent.dart';
import 'package:provider/provider.dart';
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

    final provider = Provider.of<BasicDB>(context, listen: false);
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
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
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    if (validateName(controller.text)) {
                      //save
                      provider.saveDrawing(controller.text.toString(), context);
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

  Icon get getCap {
    return Icon(Icons.ac_unit_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BasicDB, Shapes>(
      builder: (context, data, shapes, child) => Column(
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
            message: "Saving Quality max 9",
            child: FlatButton(
              child: Text(
                ((data.renderQuality)).toString(),
                style: TextStyle(),
              ),
              onPressed: () => {
                setState(() {
                  data.increaseRenderQuality();
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
              icon: data.isAntiAlias
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
                  data.changeAntiAlias();
                  // log(Constants.isAntiAlias.toString());
                });
              },
            ),
          ),

          //Strockecap
          Tooltip(
            message: "StrokeCap",
            child: InkWell(
              // isExpanded: true,
              // dropdownColor: Colors.red,
              onTap: () {
                data.changeStrokeCap();
                setState(() {});
                print("Stroke Cap " + selectedStrokeCap.toString());
              },
              child: buildStrokeCapLogo(data.strokeCap),
            ),
          ),

          //shape
          Tooltip(
            message: "Shape",
            child: Container(
              color: shapes.isRectangle ? Colors.lightBlueAccent : null,
              margin: EdgeInsets.all(4),
              child: FlatButton(
                child: SizedBox(),
                shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.only(topLeft: Radius.elliptical(0, 0)),
                  side: BorderSide(
                    color: shapes.selectedColor,
                    width: 3,
                  ),
                ),
                color: shapes.fillShape && shapes.isRectangle
                    ? shapes.selectedColor
                    : Colors.white.withAlpha(24),
                onPressed: () {
                  if (!shapes.isRectangle)
                    setState(() => shapes.updateRact());
                  else if (shapes.fillShape)
                    setState(() {
                      shapes.updateFillShape();
                      shapes.updateRact();
                    });
                  else if (shapes.isRectangle) {
                    setState(() {
                      shapes.updateFillShape();
                    });
                  }
                },
              ),
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
        ],
      ),
    );
  }

  Icon buildStrokeCapLogo(StrokeCap data) {
    if (data == StrokeCap.round) return Icon(Icons.circle);
    if (data == StrokeCap.square) return Icon(Icons.square_foot);
    if (data == StrokeCap.butt) return Icon(Icons.sanitizer);
  }
}
