import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operaton(String btntext) {
    if (btntext == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "X" ||
        btntext == "/") {
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    } else if (btntext == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;
      operand = "";
    } else {
      _output = _output + btntext;
    }

    setState(
      () {
        output = double.parse(_output).toStringAsFixed(2);
      },
    );
  }

  Widget button(String btntxt) {
    return Expanded(
      child: RawMaterialButton(
        splashColor: Colors.black,
        shape: Border.all(color: Colors.black12, width: 2),
        fillColor: Colors.black12,
        padding: EdgeInsets.all(8),
        child: Text(
          "$btntxt",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          operaton(btntxt);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculator",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "$output",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  button("9"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("8"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("7"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("/"),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("4"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("5"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("6"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("X"),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("3"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("2"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("1"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("-"),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  button("0"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("C"),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("="),
                  SizedBox(
                    width: 8.0,
                  ),
                  button("+"),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
