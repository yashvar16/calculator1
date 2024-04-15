import 'package:flutter/material.dart';
import 'components/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var output = '';
  var userInput1 = '';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          output.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                              title: 'AC',
                              onPress: () {
                                userInput = '';
                                output = '';
                                setState(() {});
                              }),
                          MyButton(
                              title: '+/-',
                              onPress: () {
                                userInput1 = userInput.substring(
                                    userInput.length - 1, userInput.length);
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                userInput += '-(${userInput1})';
                                setState(() {});
                              }),
                          MyButton(
                              title: '^',
                              onPress: () {
                                userInput += '^';
                                setState(() {});
                              }),
                          MyButton(
                              title: '/ ',
                              color: Colors.orange,
                              onPress: () {
                                userInput += '/';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: '7',
                              onPress: () {
                                userInput += '7';
                                setState(() {});
                              }),
                          MyButton(
                              title: '8',
                              onPress: () {
                                userInput += '8';
                                setState(() {});
                              }),
                          MyButton(
                              title: '9',
                              onPress: () {
                                userInput += '9';
                                setState(() {});
                              }),
                          MyButton(
                              title: '* ',
                              color: Colors.orange,
                              onPress: () {
                                userInput += '*';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: '4',
                              onPress: () {
                                userInput += '4';
                                setState(() {});
                              }),
                          MyButton(
                              title: '5',
                              onPress: () {
                                userInput += '5';
                                setState(() {});
                              }),
                          MyButton(
                              title: '6',
                              onPress: () {
                                userInput += '6';
                                setState(() {});
                              }),
                          MyButton(
                              title: '- ',
                              color: Colors.orange,
                              onPress: () {
                                userInput += '-';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: '1',
                              onPress: () {
                                userInput += '1';
                                setState(() {});
                              }),
                          MyButton(
                              title: '2',
                              onPress: () {
                                userInput += '2';
                                setState(() {});
                              }),
                          MyButton(
                              title: '3',
                              onPress: () {
                                userInput += '3';
                                setState(() {});
                              }),
                          MyButton(
                              title: '+ ',
                              color: Colors.orange,
                              onPress: () {
                                userInput += '+';
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: '0',
                              onPress: () {
                                userInput += '0';
                                setState(() {});
                              }),
                          MyButton(
                              title: '.',
                              onPress: () {
                                userInput += '.';
                                setState(() {});
                              }),
                          MyButton(
                              title: 'DEL',
                              onPress: () {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                setState(() {});
                              }),
                          MyButton(
                              title: '= ',
                              color: Colors.orange,
                              onPress: () {
                                equalPress();
                                setState(() {});
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    output = eval.toString();
  }
}
