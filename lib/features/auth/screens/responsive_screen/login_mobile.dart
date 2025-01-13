import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/login_template.dart';
import 'package:store/features/auth/screens/widgets/login_form.dart';
import 'package:store/features/auth/screens/widgets/login_header.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          height: SDeviceUtils.getScreenHeight(),
          child: const SLoginTemplate(
            child: Column(
              children: [
                ///HEADER
                LoginHeader(),
                //Form
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
