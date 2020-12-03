import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paintApp/menu/menuHandler.dart';

class StrokeCapChooser extends StatefulWidget {
  StrokeCapChooser({Key key}) : super(key: key);

  @override
  _StrokeCapChooserState createState() => _StrokeCapChooserState();
}

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _StrokeCapChooserState extends State<StrokeCapChooser> {
  bool isSelectionOpened = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton(itemBuilder: ,
      ),
    );
  }

  Row buildRowOption() {
    return Row(
      children: [
        Container(
          color: Colors.grey.withAlpha(100),
          child: IconButton(
            icon: Icon(
              Icons.sanitizer,
            ),
            onPressed: () {
              log("selection showUp " + isSelectionOpened.toString());
              setState(() {
                isSelectionOpened = !isSelectionOpened;
              });
            },
          ),
        ),
        IconButton(
          icon: FittedBox(
            child: Text("round"),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Text("butt"),
          onPressed: () {},
        ),
        IconButton(
          icon: FittedBox(
            child: Text("square"),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
