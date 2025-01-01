import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/templates/section_title_template.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
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
      shape: const BeveledRectangleBorder(),
      child: SSectionHeaderTemplate(
        color: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.close,
          ),
        ),
        action: 'Clear All',
        child: SingleChildScrollView(
          child: Column(
            spacing: TSizes.defaultSpace,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (SDeviceUtils.isMobileScreen(context) && !kIsWeb)
                TSizes.appBarHeight.height,
              ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 500),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusMd),
                      color: TColors.primaryBackground,
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        SImages.orderIcon,
                        width: 50,
                        height: 30,
                        color: TColors.primary,
                      ),
                      title: Text(
                        'Order Confirmed',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: const Text(
                          'Order ID payment for product name costs price confirmed'),
                      trailing: TextButton(
                          onPressed: () {}, child: const Text('Mark as Read')),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
