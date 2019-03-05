import 'package:flutter/material.dart';

import 'NewRouter.dart';

class CountHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Flutter Count Demo",
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new CountHomePage(title: "Flutter Count Home Page"));
  }
}

class CountHomePage extends StatefulWidget {
  String title;

  CountHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CountHomeState();
  }
}

class CountHomeState extends State<CountHomePage> {
  int counter = 0;

  void incrementCount() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You have pushed the button this many times:"),
            new Text(
              "$counter",
              style: Theme.of(context).textTheme.display1,
            ),
            new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new NewRouterPage();
                }));
              },
              child: new Text("Open a new route"),
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: incrementCount,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}
