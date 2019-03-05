import 'package:flutter/material.dart';
import 'RandomWordsState.dart';
import 'CounterDisplay.dart';
import 'CountHomePage.dart';

void main() => runApp(new CountHomeApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Counter(),
    );
  }
}
