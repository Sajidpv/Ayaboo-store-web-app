import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/login_template.dart';
import 'package:store/features/auth/screens/widgets/login_form.dart';
import 'package:store/features/auth/screens/widgets/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SLoginTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///HEADER
          LoginHeader(),
          //Form
          LoginForm(),
        ],
      ),
    );
  }
}
