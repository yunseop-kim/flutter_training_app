import 'package:flutter/material.dart';

class SecondStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pushReplacementNamed(context, "/");
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
