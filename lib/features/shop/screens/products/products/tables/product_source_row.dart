import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/common/widgets/toggles/toggle_switch.dart';
import 'package:store/features/shop/controller/brand/brand_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProductSourceRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final controller = Get.put(BrandController());
    final isLastRowOnPage = (index + 1) % 10 == 0 || index == rowCount - 1;

    return DataRow2(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
            left: BorderSide(color: Colors.grey.shade300, width: 1.0),
            right: BorderSide(color: Colors.grey.shade300, width: 1.0),
            bottom: BorderSide(
                color: Colors.grey.shade300, width: isLastRowOnPage ? 1.0 : 0),
          ),
        ),
        cells: [
          DataCell(Text(
            '${(index + 1).toString()}.',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Row(
            spacing: TSizes.spaceBtwItems,
            children: [
              const SRoundedImage(
                imageType: ImageType.asset,
                width: 50,
                height: 50,
                padding: TSizes.sm,
                image: SImages.darkAppLogo,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              Expanded(
                child: Text('Leggings',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                          color: TColors.primary,
                        )),
              ),
            ],
          )),
          DataCell(Text('Uracca',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                    color: TColors.primary,
                  ))),
          const DataCell(Text('Haash india')),
          const DataCell(Text(
            'TM123234',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'HAASH',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            SHelperFunctions.getFormattedDate(DateTime.now()),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            SHelperFunctions.getFormattedDate(DateTime.now()),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            SHelperFunctions.getFormattedDate(DateTime.now()),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            DefaultStatus.pending.toString().split('.')[1],
            maxLines: 2,
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                  color: SHelperFunctions.getDefaultStatusColor(
                      DefaultStatus.pending),
                ),
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            DefaultStatus.pending.toString().split('.')[1],
            maxLines: 2,
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                  color: SHelperFunctions.getDefaultStatusColor(
                      DefaultStatus.pending),
                ),
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(
            Obx(
              () => ToggleSwitchWidget(
                value: controller.toggleFeaturedBrand.value,
                onChanged: controller.toggleFeaturedButton,
                color: TColors.success,
              ),
            ),
          ),
          DataCell(
            Obx(
              () => ToggleSwitchWidget(
                value: controller.togglePublishedBrand.value,
                onChanged: controller.togglePublishButton,
                color: TColors.success,
              ),
            ),
          ),
          DataCell(
            Obx(
              () => ToggleSwitchWidget(
                value: controller.togglePublishedBrand.value,
                onChanged: controller.togglePublishButton,
                color: TColors.success,
              ),
            ),
          ),
          const DataCell(STableActionButtons()),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
