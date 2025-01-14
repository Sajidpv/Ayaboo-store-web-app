import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class OrderDetailsAmountCalculationSectionComponent extends StatelessWidget {
  const OrderDetailsAmountCalculationSectionComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SizedBox(
        child: Column(
          spacing: TSizes.md,
          children: [
            Row(
              children: [
                Text(
                  'Subtotal: ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: TSizes.fontSizeSm),
                ),
                const Spacer(),
                Text(
                  'Rs.456',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: TColors.darkGrey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Tax: ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: TSizes.fontSizeSm),
                ),
                const Spacer(),
                Text(
                  'Rs.456',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: TColors.darkGrey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Shipping: ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: TSizes.fontSizeSm),
                ),
                const Spacer(),
                Text(
                  'Rs.456',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: TColors.darkGrey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Coupon: ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: TSizes.fontSizeSm),
                ),
                const Spacer(),
                Text(
                  'Rs.456',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: TColors.darkGrey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Total Amount: ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                Text(
                  'Rs.456',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
