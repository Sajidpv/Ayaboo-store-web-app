import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class AccountEarningCountBannerWidget extends StatelessWidget {
  const AccountEarningCountBannerWidget({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final double count;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: TSizes.buttonWidth * 5.25),
      child: SContainerWidget(
        backgroundColor: TColors.primary,
        radius: TSizes.cardRadiusSm,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: TColors.white),
            ),
            Text(
              count.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: TColors.white),
            )
          ],
        ),
      ),
    );
  }
}
