import 'package:flutter/material.dart';

Widget buildInputFieldWithInitialTitle(
    {required String text, required Widget child}) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          text,
        ),
      ),
      Expanded(flex: 2, child: child)
    ],
  );
}
