import 'package:flutter/material.dart';
import 'package:store/common/widgets/responsive/responsive_design.dart';
import 'package:store/common/widgets/responsive/screens/desktop_screen.dart';
import 'package:store/common/widgets/responsive/screens/mobile_screen.dart';
import 'package:store/common/widgets/responsive/screens/tablet_screen.dart';

///Template for overoll site responsive to different devices
class SSiteLayout extends StatelessWidget {
  const SSiteLayout(
      {super.key,
      this.desktop,
      this.mobile,
      this.tablet,
      this.useLayout = true});
  final Widget? desktop;
  final Widget? mobile;
  final Widget? tablet;
  final bool useLayout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SResponsiveDesign(
        desktop: useLayout
            ? DesktopScreen(
                body: desktop,
              )
            : desktop ?? const SizedBox(),
        tablet: useLayout
            ? TabletScreen(
                body: tablet ?? desktop,
              )
            : tablet ?? desktop ?? const SizedBox(),
        mobile: useLayout
            ? MobileScreen(
                body: mobile ?? desktop,
              )
            : mobile ?? desktop ?? const SizedBox(),
      ),
    );
  }
}
