import 'package:flutter/material.dart';
import 'menuHandler.dart';

class MenuHolder extends StatefulWidget {
  @override
  _MenuHolderState createState() => _MenuHolderState();
}

class _MenuHolderState extends State<MenuHolder> {
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
          onPressed: () => MenuItems.saveImage(),
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
