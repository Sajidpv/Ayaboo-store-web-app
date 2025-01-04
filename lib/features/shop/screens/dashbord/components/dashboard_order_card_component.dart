import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/hover_extension.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class DashboardOrderCardComponent extends StatelessWidget {
  const DashboardOrderCardComponent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String image, title, subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 300, minHeight: 75),
      child: SContainerWidget(
        onTap: onTap,
        radius: 8,
        showShadow: true,
        showBorder: true,
        elevation: 1,
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg, vertical: TSizes.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 30,
            ),
            TSizes.spaceBtwItems.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: TColors.textSecondary,
                        fontSizeFactor: SDeviceUtils.isDesktopScreen(context)
                            ? context.width * .0004
                            : SDeviceUtils.isTabletScreen(context)
                                ? context.width * .0009
                                : .9)),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                      fontSizeFactor: SDeviceUtils.isDesktopScreen(context)
                          ? context.width * .0004
                          : SDeviceUtils.isTabletScreen(context)
                              ? context.width * .0007
                              : .6),
                ),
              ],
            ),
          ],
        ),
      ).applyHoverEffectIfWeb.showCursorOnHoverIfWeb,
    );
  }
}
