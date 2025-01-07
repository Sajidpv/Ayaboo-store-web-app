import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class DashboardCardComponent extends StatelessWidget {
  const DashboardCardComponent({
    super.key,
    required this.title,
    required this.subtitle,
    this.image,
    this.onTap,
  });

  final String title, subtitle;
  final String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      onTap: () {
        debugPrint('clicked on $title');
      },
      radius: 8,
      showShadow: true,
      elevation: .5,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.xl, vertical: TSizes.md - 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: TColors.textSecondary,
                      fontSizeFactor: SDeviceUtils.isDesktopScreen(context)
                          ? context.width * TSizes.fontSizeFactorTitleSm
                          : SDeviceUtils.isTabletScreen(context)
                              ? context.width * TSizes.fontSizeFactorTitleMd
                              : TSizes.fontSizeFactorTitleLg)),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    fontSizeFactor: SDeviceUtils.isDesktopScreen(context)
                        ? context.width * TSizes.fontSizeFactorSubTitleSm
                        : SDeviceUtils.isTabletScreen(context)
                            ? context.width * TSizes.fontSizeFactorSubTitleMd
                            : TSizes.fontSizeFactorSubTitleLg),
              ),
            ],
          ),
          SContainerWidget(
            padding: const EdgeInsets.all(TSizes.sm + 2),
            width: 45,
            height: 45,
            backgroundColor: TColors.primary.withValues(alpha: .7),
            radius: 8,
            child: Image.asset(image ?? ""),
          ),
        ],
      ),
    ).applyHoverEffectIfWeb.showCursorOnHoverIfWeb;
  }
}
