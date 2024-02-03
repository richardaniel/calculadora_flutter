import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:calc/widget/calc_buttons.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double primervalor = 0;
  double segundovalor = 0;
  double resultado = 0.0;

  void exec_operation(String operation) {
    setState(() {
      if (primervalor == null || segundovalor == null) {
        primervalor = 0;
        segundovalor = 0;
      }

      switch (operation) {
        case "sumar":
          resultado = primervalor + segundovalor;
          break;
        case "restar":
          resultado = primervalor - segundovalor;
        case "multiplicar":
          resultado = primervalor * segundovalor;
        case "dividir":
          if (segundovalor != 0) {
            resultado = primervalor / segundovalor;
          } else {
            break;
          }
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Calculadora')),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white60, Colors.white10],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2, color: Colors.white30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'Numero 1',
                      ),
                      keyboardType: TextInputType.number,
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      onChanged: (value) =>
                          primervalor = double.tryParse(value) ?? 0,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const Divider(),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'Numero 2',
                      ),
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        segundovalor = double.tryParse(value) ?? 0;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const Divider(),
                    calc_buttons(operacion: exec_operation),
                    const SizedBox(height: 10),
                    Text(
                      'Resultado: $resultado',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
