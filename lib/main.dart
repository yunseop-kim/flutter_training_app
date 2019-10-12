import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Training App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = '';
  int _lengthOfName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'What is your name?',
              style: TextStyle(fontSize: 20),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name...'),
                  onChanged: (String text) {
                    _name = text;
                    setState(() {
                      _lengthOfName = _name.length;
                    });
                  },
                )),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Text(
                'Length: ' + _lengthOfName.toString(),
              ),
            ),
            FlatButton(
              child: Text("Submit", style: TextStyle(fontSize: 15)),
              onPressed: () {
                setState(() {
                  _name;
                });
              },
            ),
            Text(_name != '' ? 'Hello, $_name!' : '',
                style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
