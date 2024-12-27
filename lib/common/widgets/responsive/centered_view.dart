import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? 10
                    : 70),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      );
    });
  }
}
