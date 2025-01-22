import 'package:flutter/material.dart';
import 'package:store/features/shop/screens/conversations/widgets/chat_field_icon_button.dart';
import 'package:store/utils/constants/colors.dart';

class ChatInputFieldWidget extends StatelessWidget {
  final VoidCallback onAttachmentTap;
  final VoidCallback onMicTap;

  const ChatInputFieldWidget({
    super.key,
    required this.onAttachmentTap,
    required this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  // controller: context.homeProvider.controller,
                  // onChanged: context.homeProvider.enterMessage,
                  decoration: InputDecoration(
                    hintText: "Type here..",
                    hintStyle: const TextStyle(
                      color: TColors.grey,
                      fontWeight: FontWeight.normal,
                      height: 0.5,
                    ),
                    suffixIcon: SizedBox(
                      child: InkWell(
                        onTap: onAttachmentTap,
                        child: const Icon(
                          Icons.attach_file,
                          color: TColors.primary,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: TColors.borderPrimary.withValues(alpha: 0.4),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ChatFieldIconButtonComponent(
          onTap: () {},
          icon: Icons.send,
          bgColor: TColors.primary,
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
