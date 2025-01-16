import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/common/widgets/buttons/material_button.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/utils/constants/colors.dart';

import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class StockRequestForm extends StatelessWidget {
  const StockRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Form(
          child: Column(
        spacing: TSizes.spaceBtwItems,
        children: [
          SPageHeading(
            heading: 'Create request',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          TSizes.spaceBtwItems.height,
          _buildShippingSectionInputs(
              text: 'Store',
              child: SCustomDropDown(
                onChanged: (p0) {},
                values: const ['Store 1', 'Store 2'],
                hint: 'Select store',
              )),
          _buildShippingSectionInputs(
            text: 'Request',
            child: TextFormField(
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: 'Message',
              ),
            ),
          ),
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
                  side: BorderSide(
                      color: TColors.blackAccent.withValues(alpha: .5)),
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                ),
              ),
              MaterialButtonWidget(
                title: 'Submit',
                onPressed: () => Get.back(),
                color: TColors.primary,
                textColor: TColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

Widget _buildShippingSectionInputs(
    {required String text, required Widget child}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          text,
        ),
      ),
      Expanded(flex: 4, child: child)
    ],
  );
}
