import 'package:flutter/material.dart';
import 'package:overlay/overlay.dart';

class OverLayApproce extends StatefulWidget {
  OverLayApproce({Key key}) : super(key: key);

  @override
  _OverLayApproceState createState() => _OverLayApproceState();
}

class _OverLayApproceState extends State<OverLayApproce> {
  bool isSelectionOpened = false;

  @override
  Widget build(BuildContext context) {
    return buildMaterialButton(context);
  }

  MaterialButton buildMaterialButton(BuildContext context) {
    return MaterialButton(
    color: Colors.lightBlueAccent,
    child: Icon(Icons.expand),
    // Call CustomOverlay Constructor in on pressed function
    onPressed: () => CustomOverlay(
      context: context,
      // Builder passes aa function removeOverlay as argument which can be used to manually remove the overlay
      builder: (removeOverlay) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () {
                    removeOverlay();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  }
}
