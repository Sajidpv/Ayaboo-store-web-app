import 'package:flutter/material.dart';
import 'package:store/features/auth/screens/widgets/login_form.dart';
import 'package:store/features/auth/screens/widgets/login_header.dart';
import 'package:store/utils/constants/sizes.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///HEADER
            LoginHeader(),
            //Form
            LoginForm(),
          ],
        ),
      )),
    );
  }
}
