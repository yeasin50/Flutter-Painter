import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:paintApp/widget/FixedPackage.dart/constants.dart';
import 'package:paintApp/menu/menuHandler.dart';
import 'package:paintApp/testFile.dart';
import 'package:paintApp/widget/FixedPackage.dart/colorPick.dart';
import 'package:paintApp/widget/drawhelper/customPainter.dart';
import 'package:paintApp/widget/drawhelper/drawingArea.dart';

import 'menu/menuHolder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State {
  List<DrawingArea> points = [];
  Color selectedColor;
  double strokeWidth;

  ///for save
  static GlobalKey globalKeyToSave = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;

    Constants.globalKey = GlobalKey();
  }

  //ColorPicker
  void selectColor() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: const Text("Pick Color"),
          content: SingleChildScrollView(
            child: CustomColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (value) {
                this.setState(() {
                  selectedColor = value;
                });
              },
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // print(width.toString() + "height " + width.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBodyStack(height, width),
      // body: TestDemo(),
    );
  }

  Stack buildBodyStack(double height, double width) {
    return Stack(
      children: <Widget>[
        Container(
          //background
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 55, 108, 1.0),
                  Color.fromRGBO(255, 22, 222, 1.0),
                  Color.fromRGBO(255, 75, 222, 1.0),
                ]),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  //sideMenu
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    height: height * .8,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      //TODO:: change menu color
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: MenuHolder(),
                  ),

                  ///art Panel
                  Container(
                    width: width * 0.85,
                    height: height * 0.80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        this.setState(() {
                          points.add(
                            DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = selectedColor
                                  ..strokeWidth = strokeWidth),
                          );
                        });
                      },
                      onPanDown: (details) {
                        this.setState(() {
                          points.add(DrawingArea(
                              point: details.localPosition,
                              areaPaint: Paint()
                                ..strokeCap = StrokeCap.round
                                ..isAntiAlias = true
                                ..color = selectedColor
                                ..strokeWidth = strokeWidth));
                        });
                      },
                      onPanEnd: (details) {
                        points.add(null);
                      },
                      child: RepaintBoundary(
                        key: Constants.globalKey,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: CustomPaint(
                            painter: MyCustomPainter(
                                points: points, key: globalKeyToSave),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              //bottom controler
              Container(
                width: width * .95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: <Widget>[
                    Tooltip(
                      message: "Color Selection",
                      child: IconButton(
                          icon: Icon(Icons.color_lens),
                          color: selectedColor,
                          onPressed: () {
                            selectColor();
                          }),
                    ),
                    //stroke width
                    Expanded(
                        child: Slider(
                      min: 1.0,
                      max: 10,
                      activeColor: selectedColor,
                      value: strokeWidth,
                      onChanged: (value) {
                        this.setState(() {
                          strokeWidth = value;
                        });
                      },
                    )),
                    Tooltip(
                      message: "Clear",
                      child: IconButton(
                        icon: Icon(Icons.layers_clear),
                        color: Colors.black,
                        onPressed: () => setState(() => points.clear()),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
