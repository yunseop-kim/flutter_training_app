import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'models/UserModel.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _MyCurrencyPageState createState() => _MyCurrencyPageState();
}

enum Nation {
  KRW,
  JPY,
  THB,
  TWD,
  USD,
}

class CurrencyVO {
  double amount = 0;
  String nation = "";
  TextEditingController controller = new TextEditingController(text: '');
}

class _MyCurrencyPageState extends State<CurrencyPage> {
  CurrencyVO _from = new CurrencyVO(), _to = new CurrencyVO();
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _from.nation = _dropDownMenuItems[0].value;
    _to.nation = _dropDownMenuItems[1].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (Nation city in Nation.values) {
      String name = city.toString().split('.')[1];
      items.add(new DropdownMenuItem(value: name, child: new Text(name)));
    }
    return items;
  }

  dynamic getCurrencyRate(CurrencyVO from, CurrencyVO to) async {
    print(from.nation + ' -> ' + to.nation);
    String url = 'https://api.exchangerate-api.com/v4/latest/' + from.nation;
    var res = await http.get(url);
    var json = convert.jsonDecode(res.body);
    double rate = json['rates'][to.nation];
    print(rate);
    setState(() {
      to.amount = from.amount * rate;
      to.controller.text = to.amount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("환율 계산기"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            DropdownButton(
              value: _from.nation,
              items: _dropDownMenuItems,
              onChanged: (String selectedCity) {
                setState(() {
                  _from.nation = selectedCity;
                  getCurrencyRate(_from, _to);
                });
              },
            ),
            TextField(
              controller: _from.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '금액 입력'),
              keyboardType: TextInputType.number,
              onChanged: (String val) {
                _from.amount = double.parse(val);
                getCurrencyRate(_from, _to);
              },
            ),
            DropdownButton(
              value: _to.nation,
              items: _dropDownMenuItems,
              onChanged: (String selectedCity) {
                setState(() {
                  _to.nation = selectedCity;
                  getCurrencyRate(_from, _to);
                });
              },
            ),
            TextField(
              controller: _to.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '금액 입력'),
              keyboardType: TextInputType.number,
              onChanged: (String val) {
                _to.amount = double.parse(val);
                getCurrencyRate(_to, _from);
              },
            ),
          ],
        )),
      );
    });
  }
}
