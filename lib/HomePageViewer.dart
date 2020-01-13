import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_indicator/page_indicator.dart';

class HomePageViewer extends StatelessWidget {
  dynamic dim;
  dynamic key1 = GlobalKey<PageContainerState>();
  List<ClipRRect> icons;

  HomePageViewer({this.dim});
  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  Widget buildSingle(var index) {
    print("inside");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: icons[index]),
    );
  }

  Widget buildList() {
    icons = [
      ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: Image(
          image: AssetImage('images/img3.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: Image(
          image: AssetImage('images/img4.jpeg'),
          fit: BoxFit.cover,
        ),
      )
    ];

    var controller = PageController();

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          height: dim.width * .5,
          color: Colors.transparent,
          margin:
              EdgeInsets.only(left: dim.width * .02, right: dim.width * .02),
          child: PageIndicatorContainer(
            shape: IndicatorShape.roundRectangleShape(
                size: Size(0, 0), cornerSize: Size(5, 5)),
            key: key1,
            indicatorSpace: dim.width * .02,
            indicatorSelectorColor: Colors.blueAccent,
            length: icons.length,
            align: IndicatorAlign.bottom,
            child: PageView.builder(
              pageSnapping: true,
              controller: controller,
              itemBuilder: (BuildContext ctxt, var index) {
                return buildSingle(index % icons.length);
              },
            ),
          )),
    );
  }
}
