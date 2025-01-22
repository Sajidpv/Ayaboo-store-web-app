import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/controller/chat/chat_controller.dart';
import 'package:store/features/shop/screens/conversations/chat/chat_home.dart';
import 'package:store/features/shop/screens/conversations/chat/chat_screen.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class SellerConversationMobileTabletScreen extends StatelessWidget {
  const SellerConversationMobileTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.defaultSpace,
            children: [
              Row(
                spacing: TSizes.defaultSpace,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SBreadcrumbsWithHeading(
                    breadcrumbItems: ['seller / conversation'],
                    heading: 'Seller Conversations',
                  ),
                  if (!SDeviceUtils.isMobileScreen(context))
                    Obx(() => controller.onChatScreen.value
                        ? const SizedBox.shrink()
                        : const SearchBox(
                            hint: 'Search by name',
                          ))
                ],
              ),
              if (SDeviceUtils.isMobileScreen(context))
                Obx(
                  () => controller.onChatScreen.value
                      ? const SizedBox.shrink()
                      : const SearchBox(
                          hint: 'Search by name',
                        ),
                ),
              Obx(() => SContainerWidget(
                  child: controller.onChatScreen.value
                      ? MessagesScreen(user: controller.conversationUser)
                      : const ChatsScreen()))
            ],
          ),
        ),
      ),
    );
  }
}
