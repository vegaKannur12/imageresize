import 'package:flutter/material.dart';
import 'package:imageresize/screen/imageSize.dart';
import 'package:imageresize/screen/image_size_grid.dart';
// import 'package:imageresize/screen/image_size_fixing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}