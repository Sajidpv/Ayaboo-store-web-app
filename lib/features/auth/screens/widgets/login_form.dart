import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/login_controller.dart';
import 'package:store/features/auth/screens/widgets/email_field_widget.dart';
import 'package:store/features/auth/screens/widgets/password_field_widget.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: TSizes.spaceBtwSections * 2,
              bottom: TSizes.spaceBtwSections),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              EmailTextFieldWidget(
                label: STexts.email,
                onChanged: (value) {},
              ),
              const InputPasswordWidget(),
              TSizes.defaultSpace.height,
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.loginWithEmailAndPassword,
                    child: Text(STexts.login.toUpperCase()),
                  )),
            ],
          ),
        ));
  }
}
