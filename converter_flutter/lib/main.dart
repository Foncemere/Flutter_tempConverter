import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      home: CtF(),
    ));

class CtF extends StatefulWidget {
  @override
  _CtFState createState() => _CtFState();
}

class _CtFState extends State<CtF> {
  final _myController = TextEditingController();
  String sign = '';
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Converter', style: TextStyle(fontFamily: 'Trajan')),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          new TextField(
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              controller: _myController,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child:
                    Text('Fahrenheit', style: TextStyle(fontFamily: 'Trajan')),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      result = (double.parse(_myController.text) - 32) * 5 / 9;
                      sign = 'C';
                    });
                  },
                  child: Text('Convert F to C',
                      style: TextStyle(fontFamily: 'Trajan')),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child: Text('Celcius', style: TextStyle(fontFamily: 'Trajan')),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      result = (double.parse(_myController.text) * 9 / 5) + 32;
                      sign = 'F';
                    });
                  },
                  child: Text('Convert C to F',
                      style: TextStyle(fontFamily: 'Trajan')),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
                padding: EdgeInsets.all(30.0),
                child: Text('$result°$sign is the answer',
                    style: TextStyle(fontFamily: 'Trajan'))),
          ]),
        ]));
  }
}
