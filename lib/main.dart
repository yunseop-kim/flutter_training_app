import 'package:flutter/material.dart';
import 'SecondStage.dart';
import 'FirstStage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstStage(title: 'Flutter Training App'),
      routes: {
        "/second": (_) => new SecondStage(),
      },
    );
  }
}
