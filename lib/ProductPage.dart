import 'package:flutter/material.dart';

class ProductRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Display(),
    );
  }
}

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    GlobalKey key = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: key,
      bottomSheet: BottomSheet(
        onClosing: () {
          print("hey");
        },
        enableDrag: true,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black,
          );
        },
      ),
    );
  }

  void func() {}
}
