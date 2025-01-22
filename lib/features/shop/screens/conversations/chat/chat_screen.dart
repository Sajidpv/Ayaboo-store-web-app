import 'package:flutter/material.dart';
import 'package:store/features/auth/models/user_model.dart';
import 'package:store/features/shop/screens/conversations/data/demo_chat_messages.dart';
import 'package:store/features/shop/screens/conversations/widgets/chat_input_field.dart';
import 'package:store/features/shop/screens/conversations/widgets/message_widget.dart';
import 'package:store/utils/constants/colors.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => MessageWidget(
                message: demeChatMessages[index],
                user: user,
              ),
            )),
        const ChatInputField(),
      ],
    );
  }
}

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 16.0 / 2,
        ),
        child: Column(
          children: [
            Material(
              elevation: 0,
              borderRadius: BorderRadius.circular(20),
              child: ChatInputFieldWidget(
                onAttachmentTap: () {},
                onMicTap: () {},
              ),
            ),
          ],
        ));
  }
}
