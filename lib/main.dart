import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondStage.dart';
import 'FirstStage.dart';
import 'ThirdStage.dart';
import 'CurrencyPage.dart';
import 'models/UserModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => UserModel(),
        child: MaterialApp(
          title: 'Flutter Training',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FirstStage(title: 'Flutter Training App'),
          routes: {
            "/second": (_) => new SecondStage(),
            "/third": (_) => new ThirdStage(),
            "/currency": (_) => new CurrencyPage(),
          },
        ));
  }
}
