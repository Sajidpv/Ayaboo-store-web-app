import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/widgets/notification_tiles.dart';
import 'package:store/common/widgets/layouts/templates/section_title_template.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class SNotificationSidebar extends StatelessWidget {
  const SNotificationSidebar({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      backgroundColor: Colors.white,
      shape: const BeveledRectangleBorder(),
      child: Column(
        children: [
          if (SDeviceUtils.isMobileScreen(context) && !kIsWeb)
            (TSizes.appBarHeight / 2).height,
          SSectionHeaderTemplate(
            color: Colors.white,
            elevation: 0,
            title: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close,
              ),
            ),
            action: 'Clear All',
            child: const SingleChildScrollView(
              child: Column(
                spacing: TSizes.spaceBtwItems,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationTile(),
                  NotificationTile(),
                  NotificationTile(),
                  NotificationTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
