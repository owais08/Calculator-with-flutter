import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget btn(var textt, [colorred]) {
    return Expanded(
      child: Container(
        color: colorred,
        height: 70,
        child: OutlinedButton(
          onPressed: () => setState(() {
            result = result + textt;
          }),
          child: Text(
            textt,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }

  output() {
    setState(() {
      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        result = eval.toString();
      });
    });
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    btn(
                      "7",
                    ),
                    btn(
                      "8",
                    ),
                    btn(
                      "9",
                    ),
                    btn(
                      "/",
                      Colors.blue[300],
                    ),
                  ],
                ),
                Row(
                  children: [
                    btn(
                      "4",
                    ),
                    btn(
                      "5",
                    ),
                    btn(
                      "6",
                    ),
                    btn(
                      "*",
                      Colors.blue[300],
                    ),
                  ],
                ),
                Row(
                  children: [
                    btn(
                      "1",
                    ),
                    btn(
                      "2",
                    ),
                    btn(
                      "3",
                    ),
                    btn(
                      "-",
                      Colors.blue[300],
                    ),
                  ],
                ),
                Row(
                  children: [
                    btn(
                      ".",
                    ),
                    btn(
                      "0",
                    ),
                    btn(
                      "00",
                    ),
                    btn(
                      "+",
                      Colors.blue[300],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        height: 70,
                        child: OutlinedButton(
                          onPressed: clearr,
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        height: 70,
                        child: OutlinedButton(
                          onPressed: output,
                          child: Text(
                            "=",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
