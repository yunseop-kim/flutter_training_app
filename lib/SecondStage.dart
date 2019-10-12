import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/UserModel.dart';

class SecondStage extends StatefulWidget {
  @override
  _MySecondStageState createState() => _MySecondStageState();
}

class _MySecondStageState extends State<SecondStage> {
  String _proverb;
  @override
  Widget build(BuildContext context) {
    String _name = Provider.of<UserModel>(context).name;
    return Consumer<UserModel>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("$_name 님의 명언"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('당신의 명언을 적어주세요.'),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '띵언을 적어주세요.'),
              onChanged: (String text) {
                setState(() {
                  _proverb = text;
                });
              },
            ),
            Text('$_name 님의 명언: "$_proverb"'),
            RaisedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pushReplacementNamed(context, "/third");
                // Provider.of<UserModel>(context).inputName('');
              },
              child: Text('다음'),
            ),
          ],
        )),
      );
    });
  }
}
