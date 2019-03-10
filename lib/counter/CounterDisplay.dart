import 'package:flutter/material.dart';

/**
 * 简单计数器的实现，展示了StatefulWidget的使用方式
 */
class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text(
      "Count: $count",
      textAlign: TextAlign.right,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text("Increment"),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CounterState();
  }
}

class CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increment),
      new CounterDisplay(count: _counter)
    ]);
  }
}
