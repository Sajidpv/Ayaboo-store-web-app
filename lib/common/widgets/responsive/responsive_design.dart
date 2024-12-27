import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class SResponsiveDesign extends StatelessWidget {
  const SResponsiveDesign(
      {super.key,
      required this.desktop,
      required this.mobile,
      required this.tablet});
  final Widget desktop, mobile, tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth >= TSizes.desktopScreenSize) {
        return desktop;
      } else if (constraints.maxWidth > TSizes.desktopScreenSize &&
          constraints.maxWidth >= TSizes.tabletScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
