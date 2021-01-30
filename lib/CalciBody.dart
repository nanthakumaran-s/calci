import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalciBody extends StatefulWidget {
  @override
  _CalciBodyState createState() => _CalciBodyState();
}

class _CalciBodyState extends State<CalciBody> {
  String output = "0.00";
  String _out = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String btnVal) {
    if (btnVal == "AC") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
    } else {
      _out = _out + btnVal;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  buildButton(String buttonVal) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFF262626),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(6, 4),
              blurRadius: 8.0,
              spreadRadius: 0.3,
            ),
          ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(28.0),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            buttonVal,
            style: GoogleFonts.montserrat(
              fontSize: 25.0,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
          onPressed: () => buttonPressed(buttonVal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF262626),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
                  child: Text(
                    output,
                    style: GoogleFonts.montserrat(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                child: Divider(
                  color: Colors.white,
                  indent: 50,
                  endIndent: 50,
                  thickness: 0.4,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("AC"),
                      buildButton("."),
                      buildButton("*")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
