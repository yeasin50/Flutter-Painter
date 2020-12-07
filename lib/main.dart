import 'package:flutter/material.dart';
import 'package:paintApp/provider/dataProvider.dart';

import 'package:paintApp/provider/shapeSelection.dart';

import 'package:paintApp/widget/screen/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // (context) => Shapes(),
      providers: [
        ChangeNotifierProvider.value(value: Shapes()),
        ChangeNotifierProvider.value(value: BasicDB()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
