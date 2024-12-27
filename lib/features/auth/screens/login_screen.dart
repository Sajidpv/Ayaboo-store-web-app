import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/auth/screens/responsive_screen/login_desktop_tablet.dart';
import 'package:store/features/auth/screens/responsive_screen/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      useLayout: false,
      desktop: LoginDesktopTablet(),
      mobile: LoginMobile(),
    );
  }
}
