import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/login_controller.dart';
import 'package:store/utils/validators/validation.dart';

class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget(
      {super.key, required this.label, required this.onChanged});
  final String label;
  final Function(String)? onChanged;
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
        TextFormField(
            controller: loginController.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: SValidator.validateEmail,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: label,
            ),
            onChanged: onChanged),
      ],
    );
  }
}
