import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String userInput = "";
  String resultado = "0";
  @override
  Widget build(BuildContext context) {
    List<String> btnLista = [
      'AC',
      '(',
      ')',
      '/',
      '7',
      '8',
      '9',
      '*',
      '4',
      '5',
      '6',
      '+',
      '1',
      '2',
      '3',
      '-',
      'C',
      '0',
      '.',
      '=',
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 118, 108, 100),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  resultado,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
              )
            ]),
          ),
          const Divider(
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                  itemCount: btnLista.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemBuilder: (BuildContext context, index) {
                    return customButton(btnLista[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(String text) {
    return InkWell(
      splashColor: Colors.blueGrey,
      onTap: () {
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
            color: getColorBtn(text),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 0.5,
                  offset: const Offset(-3, -3))
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: getColor(text),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Color getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return const Color.fromRGBO(118, 69, 59, 1);
    }
    return Colors.white;
  }

  getColorBtn(String text) {
    if (text == "AC") {
      return const Color.fromRGBO(118, 69, 59, 1);
    }
    if (text == "=") {
      return const Color.fromRGBO(118, 69, 59, 1);
    }
    return const Color.fromRGBO(67, 118, 108, 1);
  }

  handleButton(String text) {
    if (text == "AC") {
      userInput = "";
      resultado = "0";
      return;
    }
    if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == "=") {
      resultado = calculate();
      userInput = resultado;

      if (userInput.endsWith(".0")) {
        userInput = userInput + (text.replaceAll("=", ""));
      }

      if (resultado.endsWith(".0")) {
        resultado = resultado.replaceAll(".0", "");
        return;
      }
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evalutation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evalutation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
