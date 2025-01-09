import 'package:flutter/material.dart';

class SPageHeading extends StatelessWidget {
  const SPageHeading(
      {super.key, required this.heading, this.rightSideWidget, this.style});
  final String heading;
  final Widget? rightSideWidget;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
          style: style ?? Theme.of(context).textTheme.headlineLarge,
        ),
        rightSideWidget ?? const SizedBox()
      ],
    );
  }
}
