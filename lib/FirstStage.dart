import 'package:flutter/material.dart';

class FirstStage extends StatefulWidget {
  FirstStage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirstStageState createState() => _FirstStageState();
}

class _FirstStageState extends State<FirstStage> {
  String _name = '';
  int _lengthOfName;

  @override
  Widget build(BuildContext context) {
    Widget nextStepBuilder() => _name != ''
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(_name != '' ? '안녕하세요, $_name님! 다음 단계로 넘어가시겠어요?' : '',
                style: TextStyle(fontSize: 15)),
            FlatButton(
              child: Text("다음"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/second");
              },
            )
          ])
        : Column();

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
                    setState(() {
                      _name = text;
                      _lengthOfName = _name.length;
                    });
                  },
                )),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Text(
                '길이: ' + _lengthOfName.toString(),
              ),
            ),
            // FlatButton(
            //   child: Text("입력", style: TextStyle(fontSize: 15)),
            //   onPressed: () {
            //     setState(() {
            //       _name;
            //     });
            //   },
            // ),
            nextStepBuilder()
          ],
        ),
      ),
    );
  }
}
