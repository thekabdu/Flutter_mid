import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double num1 = 0;
  double num2 = 0;

  dynamic res = '';
  dynamic finalRes = '';
  dynamic op = '';
  dynamic preOp = '';

  Widget btn(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () {
          calculation(btnText);
        },
        color: color,
        padding: EdgeInsets.all(22.0),
      ),
    );
  }

  Widget btnZero(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () {
          calculation(btnText);
        },
        color: color,
        padding: EdgeInsets.only(left: 51, top: 20, right: 51, bottom: 20),
      ),
    );
  }

  Widget build(BuildContext buildContext) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('C', Colors.grey[300]),
                btn('+/-', Colors.grey[300]),
                btn('%', Colors.grey[300]),
                btn('/', Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('7', Colors.grey),
                btn('8', Colors.grey),
                btn('9', Colors.grey),
                btn('x', Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('4', Colors.grey),
                btn('5', Colors.grey),
                btn('6', Colors.grey),
                btn('-', Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('1', Colors.grey),
                btn('2', Colors.grey),
                btn('3', Colors.grey),
                btn('+', Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnZero('0', Colors.grey),
                btnZero('.', Colors.grey),
                btnZero('=', Colors.orange),
              ],
            )
          ],
        ),
      ),
    );
  }

  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      num1 = 0;
      num2 = 0;
      res = '';
      finalRes = '';
      op = '';
      preOp = '';
    } else if (op == '-' && btnText == '-') {
      if (preOp == '+') {
        finalRes = add();
      } else if (preOp == '-') {
        finalRes = sub();
      } else if (preOp == 'x') {
        finalRes = mult();
      } else if (preOp == '/') {
        finalRes = div();
      }
    } else if (btnText == '+' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '-') {
      if (num1 == 0) {
        num1 = double.parse(res);
      } else {
        num2 = double.parse(res);
      }
      if (op == '+') {
        finalRes = add();
      } else if (preOp == '-') {
        finalRes = sub();
      } else if (preOp == 'x') {
        finalRes = mult();
      } else if (preOp == '/') {
        finalRes = div();
      }
      preOp = op;
      op = btnText;
      res = '';
    } else if (btnText == '%') {
      res = num1 / 100;
      finalRes = doesContainDecimal(res);
    } else if (btnText == '.') {
      setState(() {
        if (!res.toString().contains('.')) {
          res = res.toString() + '.';
        }
        finalRes = res;
      }
          /*else if (btnText= '+/-'){} */
          );
    }
  }

  String add() {
    res = (num1 + num2).toString();
    num1 = double.parse(res);
    return doesContainDecimal(res);
  }

  String sub() {
    res = (num1 - num2).toString();
    num1 = double.parse(res);
    return doesContainDecimal(res);
  }

  String mult() {
    res = (num1 * num2).toString();
    num1 = double.parse(res);
    return doesContainDecimal(res);
  }

  String div() {
    res = (num1 / num2).toString();
    num1 = double.parse(res);
    return doesContainDecimal(res);
  }

  doesContainDecimal(dynamic res) {
    if (res.toString().contains('.')) {
      List<String> splitDecimal = res.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return res = splitDecimal[0].toString();
    }
    return res;
  }
}
