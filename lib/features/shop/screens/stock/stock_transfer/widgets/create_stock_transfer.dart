import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/buttons/material_button.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/common/widgets/inputs/browse_images.dart';
import 'package:store/common/widgets/inputs/build_input_field_with_initial_title.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

List<Widget> buildCreateStockTransferAlertdialogActions() {
  return [
    Row(
      spacing: TSizes.spaceBtwItems,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButtonWidget(
          elevation: 0,
          title: 'Cancel',
          color: TColors.white,
          textColor: TColors.darkGrey,
          onPressed: () => Get.back(),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: TColors.blackAccent.withValues(alpha: .5)),
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
          ),
        ),
        MaterialButtonWidget(
          title: 'Submit',
          onPressed: () {},
          color: TColors.primary,
          textColor: TColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
          ),
        )
      ],
    )
  ];
}

Widget buildCreateStockTransferAlerDialogContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    spacing: TSizes.sm,
    children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.spaceBtwInputFields,
            children: [
              Text(
                'Stock Transfer to other store',
                style: Theme.of(Get.context!).textTheme.headlineSmall,
              ),
              buildInputFieldWithInitialTitle(
                text: 'To',
                child: SCustomDropDown(
                  onChanged: (p0) {},
                  hint: 'Select store',
                  values: const ['store1', 'store 2'],
                ),
              ),
              buildInputFieldWithInitialTitle(
                  text: 'Bill / Delivery Challan', child: const SBrowsImages()),
              buildInputFieldWithInitialTitle(
                text: 'Product name/SKU',
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Date'),
                ),
              ),
            ],
          ),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: TSizes.spaceBtwItems,
        children: [
          const SRoundedImage(
            imageType: ImageType.asset,
            width: 70,
            height: 70,
            padding: TSizes.sm,
            image: SImages.darkAppLogo,
            borderRadius: TSizes.borderRadiusMd,
            backgroundColor: TColors.primaryBackground,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Odio Angle Leggings',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: TSizes.md),
                ),
                Text(
                  'Subtotal: \$48976',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 300,
        width: 700,
        child: Text('here data'),
      ),
    ],
  );
}
