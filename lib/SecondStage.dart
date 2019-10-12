import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/UserModel.dart';

class SecondStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _name = Provider.of<UserModel>(context).name;
    return Consumer<UserModel>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("$_name"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Text('Go back!'),
            ),
          ],
        )),
      );
    });
  }
}
