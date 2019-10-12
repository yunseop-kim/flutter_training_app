import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/UserModel.dart';

class ThirdStage extends StatefulWidget {
  @override
  _MyThirdStageState createState() => _MyThirdStageState();
}

class _MyThirdStageState extends State<ThirdStage> {
  int _myAge, _retireAge;

  Widget _buildResult() {
    if (_myAge != null && _retireAge != null) {
      int _remained = (_retireAge - _myAge);
      int _currentYear = DateTime.now().year;
      int _retireYear = (_currentYear + _remained);
      String result =
          "은퇴까지 $_remained 년 남았습니다. 올해는 $_currentYear 년이니, $_retireYear 년에 은퇴하시겠군요!";
      return Text(result);
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    String _name = Provider.of<UserModel>(context).name;
    return Consumer<UserModel>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("$_name 님의 퇴직연도"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('현재 나이가 몇살인가요?'),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '나이를 알려주세요'),
              keyboardType: TextInputType.number,
              onChanged: (String val) {
                setState(() {
                  _myAge = int.parse(val);
                });
              },
            ),
            Text('언제 은퇴하고 싶으신가요?'),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '은퇴 희망 나이를 적어주세요'),
              keyboardType: TextInputType.number,
              onChanged: (String val) {
                setState(() {
                  _retireAge = int.parse(val);
                });
              },
            ),
            _buildResult()
            // RaisedButton(
            //   onPressed: () {
            //     // Navigate back to first route when tapped.
            //     Navigator.pushReplacementNamed(context, "/");
            //     Provider.of<UserModel>(context).inputName('');
            //   },
            //   child: Text('Go back!'),
            // ),
          ],
        )),
      );
    });
  }
}
