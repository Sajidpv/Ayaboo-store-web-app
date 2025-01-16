import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/animations/floating_gester_widget.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/auth/screens/responsive_screen/login_desktop_tablet.dart';
import 'package:store/features/auth/screens/responsive_screen/login_mobile.dart';
import 'package:store/utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SSiteLayout(
      backgroundColor: TColors.blackAccent,
      useLayout: false,
      desktop: FloatingDraggableWidget(
        floatingWidget: const LoginDesktopTablet(),
        mainScreenWidget: SizedBox(
          width: context.width,
          height: context.height,
        ),
        floatingWidgetHeight: 570,
        floatingWidgetWidth: 420,
      ),
      mobile: const LoginMobile(),
    );
  }
}
