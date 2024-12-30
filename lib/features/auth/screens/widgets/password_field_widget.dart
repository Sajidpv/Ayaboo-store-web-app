import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/login_controller.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/validators/validation.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    super.key,
    this.label = 'Password',
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(
            label,
          ),
        ),
        Obx(
          () => TextFormField(
            controller: loginController.passwordController,
            validator: SValidator.validatePassword,
            obscureText: loginController.isObscureText.value,
            obscuringCharacter: "*",
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: STexts.password,
              suffixIcon: InkWell(
                  onTap: () {
                    loginController.isObscureText.value =
                        !loginController.isObscureText.value;
                  },
                  child: Icon(loginController.isObscureText.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            STexts.passwordHint,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
