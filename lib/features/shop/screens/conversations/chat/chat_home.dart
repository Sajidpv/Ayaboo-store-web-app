import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/models/user_model.dart';
import 'package:store/features/shop/controller/chat/chat_controller.dart';
import 'package:store/features/shop/screens/conversations/data/demo_chats.dart';
import 'package:store/features/shop/screens/conversations/widgets/active_indicator.dart';
import 'package:store/routes/routes.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: chatsData.length,
          itemBuilder: (context, index) => ChatCard(
            chat: chatsData[index],
            press: () {
              controller.conversationUserClicked(chatsData[index]);
              controller.changeChatScreen(true);
              Navigator.pushNamed(context, SRoutes.conversationChat,
                  arguments: chatsData[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
    required this.press,
  });

  final UserModel chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0 * 0.75),
        child: Row(
          children: [
            CircleAvatarWithActiveIndicator(
              image: chat.image,
              isActive: chat.isActive,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage ?? 'Tap to start chating',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(chat.time ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
