import 'package:flutter/material.dart';
import 'package:store/features/shop/models/chat_model.dart';
import 'package:store/features/shop/screens/conversations/widgets/message_status_dot.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    this.message,
  });

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0 * 0.95,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color: message!.isSender
            ? TColors.white
            : TColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                message!.text,
                style: const TextStyle(
                  color: TColors.black,
                ),
              ),
              if (!message!.isSender) ...[10.width, timeSlot()]
            ],
          ),
          if (message!.isSender)
            Row(
              children: [
                Row(
                  children: [
                    timeSlot(),
                    MessageStatusDotComponent(status: message?.messageStatus),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Text timeSlot() {
    return Text(
      message!.time.toString(),
      style: const TextStyle(
        fontSize: 9,
        color: TColors.darkGrey,
      ),
    );
  }
}
