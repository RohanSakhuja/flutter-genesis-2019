import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import './home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Genesis App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}





