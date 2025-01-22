import 'package:flutter/material.dart';
import 'package:store/features/shop/models/chat_model.dart';
import 'package:store/utils/constants/colors.dart';

class MessageStatusDotComponent extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDotComponent({super.key, this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      height: 18,
      width: 18,
      child: Icon(
        _getMessageStatusIcon(status!),
        size: 14,
        color: dotColor(status!),
      ),
    );
  }

  IconData _getMessageStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.notSent:
        return Icons.refresh;
      case MessageStatus.viewed:
        return Icons.done_all;
      case MessageStatus.notView:
        return Icons.done;
      default:
        return Icons.help;
    }
  }

  Color dotColor(MessageStatus status) {
    switch (status) {
      case MessageStatus.notSent:
        return TColors.error;
      case MessageStatus.notView:
        return TColors.darkGrey;
      case MessageStatus.viewed:
        return TColors.primary;
      default:
        return Colors.transparent;
    }
  }
}
