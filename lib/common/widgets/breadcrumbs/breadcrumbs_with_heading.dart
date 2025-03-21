import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';

import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class SBreadcrumbsWithHeading extends StatelessWidget {
  const SBreadcrumbsWithHeading(
      {super.key,
      this.heading,
      required this.breadcrumbItems,
      this.returnToPreviousScreen = false,
      this.style});
  final String? heading;
  final List<String> breadcrumbItems;
  final TextStyle? style;
  final bool returnToPreviousScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(SRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text('Dashboard',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: -1)),
              ),
            ),
            for (int i = 0; i < breadcrumbItems.length; i++)
              Row(
                children: [
                  const Text(
                    '/',
                    style: TextStyle(color: TColors.darkGrey),
                  ),
                  InkWell(
                    onTap: i == breadcrumbItems.length - 1
                        ? null
                        : () => Get.toNamed(breadcrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),
                      child: Text(
                          i == breadcrumbItems.length - 1
                              ? breadcrumbItems[i].capitalize.toString()
                              : capitalize(breadcrumbItems[i].substring(1)),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontWeightDelta: -1)),
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (returnToPreviousScreen || heading != null)
          Row(
            spacing: returnToPreviousScreen ? TSizes.spaceBtwItems : 0,
            children: [
              if (returnToPreviousScreen)
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back)),
              if (heading != null)
                SPageHeading(
                  heading: heading!,
                  style: style ??
                      Theme.of(context).textTheme.headlineMedium!.apply(
                          fontSizeFactor: SDeviceUtils.isMobileScreen(context)
                              ? context.width * .003
                              : 1),
                )
            ],
          )
      ],
    );
  }

  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
