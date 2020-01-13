import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maria_john/HomePageViewer.dart';
import 'package:maria_john/CustomnScrollBarBehaviour.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Maria and John'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var dim;

class _MyHomePageState extends State<MyHomePage> {
  List<Image> icons;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    dim = queryData.size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: dim.width * 0.07),
        ),
        elevation: 0.0,
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBarBehavior(),
        child: Column(
          children: <Widget>[
            SizedBox(child: new HomePageViewer(dim: dim)),
            Padding(
              padding: EdgeInsets.only(bottom: dim.width * .04),
            ),
            Expanded(child: displayGrid())
          ],
        ),
      ),
    );
  }

  Widget displayGrid() {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (i) {
          return Center(
            child: createSingle(),
          );
        }));
  }

  Widget createSingle() {
    return Container(
        height: dim.width,
        width: dim.width * .4,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage('images/img3.jpeg'),
              ),
              Text("hey")
            ],
          ),
        ));
  }
}
