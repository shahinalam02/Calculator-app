import 'package:calculator_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({
    super.key,
  });

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var usertext = '';
  var useranswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isoperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f172a),
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    usertext,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    useranswer,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Button(
                        buttontap: () {
                          setState(() {
                            usertext = '';
                          });
                        },
                        color: Colors.green,
                        buttontext: buttons[index],
                        textcolor: Colors.white);
                  } else if (index == 1) {
                    return Button(
                        buttontap: () {
                          setState(() {
                            usertext =
                                usertext.substring(0, usertext.length - 1);
                          });
                        },
                        color: Colors.red,
                        buttontext: buttons[index],
                        textcolor: Colors.white);
                  } else if (index == buttons.length - 1) {
                    return Button(
                        buttontap: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Colors.deepOrange,
                        buttontext: buttons[index],
                        textcolor: Colors.white);
                  } else if (index == buttons.length - 2) {
                    return Button(
                        buttontap: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Colors.deepPurpleAccent,
                        buttontext: buttons[index],
                        textcolor: Colors.white);
                  } else {
                    return Button(
                      buttontap: () {
                        setState(() {
                          usertext += buttons[index];
                        });
                      },
                      color: isoperator(buttons[index])
                          ? Colors.deepOrange
                          : Colors.white,
                      buttontext: buttons[index],
                      textcolor: isoperator(buttons[index])
                          ? Colors.white
                          : Color(0xFF0f172a),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void equalPressed() {
    String finalQuestion = usertext;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    useranswer = eval.toString();
  }
}
