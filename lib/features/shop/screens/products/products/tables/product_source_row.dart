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
import 'package:store/utils/extensions/spacer_extension.dart';
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
          DataCell(Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: TSizes.spaceBtwItems,
              children: [
                const SRoundedImage(
                  imageType: ImageType.asset,
                  width: 100,
                  height: 100,
                  padding: TSizes.sm,
                  image: SImages.darkAppLogo,
                  borderRadius: TSizes.borderRadiusMd,
                  backgroundColor: TColors.primaryBackground,
                ),
                Expanded(
                  child: ListView(
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
                      TSizes.sm.height,
                      _buildProductDescriptionDetails(
                          title: 'Brand', value: 'Odio fashion'),
                      _buildProductDescriptionDetails(
                          title: 'Wheight in gm', value: '200'),
                      _buildProductDescriptionDetails(
                          title: 'Min. order', value: '10'),
                      _buildProductDescriptionDetails(
                          maxLines: 2, title: 'Size', value: 'L,XL,M,XXL,XXXL'),
                      _buildProductDescriptionDetails(
                          maxLines: 2,
                          title: 'Color',
                          value: 'RED,BLUE,GREEN,BLACK,YELLOW'),
                    ],
                  ),
                ),
              ],
            ),
          )),
          const DataCell(Text(
            'Haash india',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )),
          DataCell(Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: TSizes.spaceBtwItems,
                    children: [
                      SRoundedImage(
                        imageType: ImageType.asset,
                        width: 50,
                        height: 50,
                        padding: TSizes.sm,
                        image: SImages.darkAppLogo,
                        borderRadius: TSizes.borderRadiusMd,
                        backgroundColor: TColors.primaryBackground,
                      ),
                      Expanded(
                          child: Text(
                        'Red',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    TSizes.spaceBtwItems.height,
                itemCount: 5,
              ))),
          DataCell(Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const Text(
                    'S-150, M-100, L-200',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    TSizes.spaceBtwItems.height,
                itemCount: 5,
              ))),
          const DataCell(Text(
            '10%',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '499',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '399',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '499',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '699',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            DeliveryStatus.pending.toString().split('.')[1],
            maxLines: 2,
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                  color: SHelperFunctions.getDeliveryStatusColor(
                      DeliveryStatus.pending),
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

Widget _buildProductDescriptionDetails(
    {required String title, required String value, int maxLines = 1}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$title : ',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(Get.context!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: TSizes.fontSizeSm),
      ),
      Expanded(
        child: Text(
          value,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .copyWith(color: TColors.darkGrey),
        ),
      ),
    ],
  );
}
