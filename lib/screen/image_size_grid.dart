import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:imageresize/screen/imageSize.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage(int col, double cont_actual_h_prop, List<String> widgetList, double paddingbottom, double paddingtop, double paddingright, double paddingleft, double description1height, double description2height);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImageResize imageResize = ImageResize();

  int col = 2;
  double paddingtop = 5;
  double paddingbottom = 5;
  double paddingleft = 5;
  double paddingright = 5;
  double imagewidth = 600;
  double imageheight = 800;
  double description1Height = 20;
  double description2Height = 10;

      double? imageActualWidth;
    double? imageActualheight;
    double? containerActualHieght;
    double? cont_actual_h_prop;

  List<String> widgetList = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
  ];
  List result = [];

  @override
  Widget build(BuildContext context) {



    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    result = imageResize.imageResizeFun(
        screenwidth,
        screenheight,
        description1Height,
        description2Height,
        paddingtop,
        paddingbottom,
        paddingright,
        paddingleft,
        imagewidth,
        imageheight,
        col);
    containerActualHieght=result[0];
    imageActualWidth=result[1];
    imageActualheight=result[2];
    cont_actual_h_prop=result[3];
    ////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: const Text("gridview"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          // mainAxisExtent: 150,
          // childAspectRatio: containerWidth/containerActualHieght,
          childAspectRatio: cont_actual_h_prop!,
        ),
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
//remove color to make it transpatent
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.white)),
            height: containerActualHieght,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: paddingbottom,
                  top: paddingtop,
                  left: paddingleft,
                  right: paddingright),
              child: Column(
                children: [
                  Expanded(
                    // height: imageActualheight,
                    // flex:9,
                    child: Image.asset(
                      "asset/${widgetList[index]}",
                      height: imageActualheight,
                      width: imageActualWidth,
                      filterQuality: FilterQuality.high,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      color: Colors.red,
                      height: description1Height,
                      child: Text("Flower")),
                  // SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    height: description2Height,
                    child: Text(
                      "rose beautifull flower r range of colour, size,",
                      style: TextStyle(fontSize: 12, color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
