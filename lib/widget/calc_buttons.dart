import 'dart:html';

import 'package:flutter/material.dart';

class calc_buttons extends StatelessWidget {
  final Function(String) operacion;

  const calc_buttons({Key? key, required this.operacion}) : super(key: key);

  static const styles = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 20,
  );

  static const button_style =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: () => operacion("sumar"),
          child: const Text('+', style: styles),
          style: button_style,
        ),
        ElevatedButton(
          onPressed: () => operacion(
            "restar",
          ),
          child: const Text(
            '-',
            style: styles,
          ),
          style: button_style,
        ),
        ElevatedButton(
          onPressed: () => operacion("multiplicar"),
          child: const Text(
            '*',
            style: styles,
          ),
          style: button_style,
        ),
        ElevatedButton(
          onPressed: () => operacion("dividir"),
          child: const Text(
            '/',
            style: styles,
          ),
          style: button_style,
        ),
      ],
    );
  }
}
