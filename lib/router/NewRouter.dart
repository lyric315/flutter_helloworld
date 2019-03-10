import 'package:flutter/material.dart';

class NewRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Router"),
      ),
      body: new Center(
        child: Text("This is new route"),
      ),
    );
  }
}
