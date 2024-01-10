import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    String userInput = "";
    String resultado = "0";

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
      '=',
      '.',
    ];
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  resultado,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
              )
            ]),
          ),
          Divider(
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                  itemCount: btnLista.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemBuilder: (BuildContext context, index) {
                    return CustomButton(btnLista[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Colors.blueGrey,
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 4,
                  spreadRadius: 0.5,
                  offset: Offset(-3, -3))
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
