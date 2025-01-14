import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/shop/screens/sales/order_details/components/build_text_sections.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class QrcodeSection extends StatelessWidget {
  const QrcodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.spaceBtwItems,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SRoundedImage(
          imageType: ImageType.asset,
          image: SImages.qrcode,
          width: 140,
          height: 140,
          padding: TSizes.sm,
          borderRadius: TSizes.borderRadiusMd,
          backgroundColor: TColors.primaryBackground,
        ),
        buildProductDescriptionDetails(
          titleStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: TColors.darkGrey),
          bodyStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: TColors.black),
          title: 'Order ID',
          value: '20240506-21040475 ',
        ),
        buildProductDescriptionDetails(
          title: 'Order Date',
          value: 'March-08-2024',
        ),
        SContainerWidget(
            radius: TSizes.cardRadiusXs - 2,
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs, horizontal: TSizes.md),
            backgroundColor: TColors.primary.withValues(alpha: .1),
            child:
                Text(PaymentStatus.pending.toString().split('.')[1].capitalize!,
                    style: const TextStyle(
                      color: TColors.primary,
                    )))
      ],
    );
  }
}
