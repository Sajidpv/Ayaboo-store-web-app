import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class OrderDetailsTableSourceRow extends DataTableSource {
  final SalesController controller = Get.put(SalesController());

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: index == 0 ? Colors.grey.shade300 : Colors.transparent,
              width: index == 0 ? 1.0 : 0),
          left: BorderSide(color: Colors.grey.shade300, width: 1.0),
          right: BorderSide(color: Colors.grey.shade300, width: 1.0),
          bottom: BorderSide(
              color: Colors.grey.shade300, width: index == 10 ? 1.0 : 0),
        ),
      ),
      onTap: () =>
          controller.selectedRows[index] = !controller.selectedRows[index],
      selected: controller.selectedRows[index],
      // onSelectChanged: (value) =>
      //     controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text('${index + 1}.')),
        DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Text(
                'Odio Angle Leggings',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(Get.context!)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: TSizes.md),
              ),
            ),
          ],
        )),
        const DataCell(Text('Cash On Delivery')),
        DataCell(Text('${index + 2}')),
        DataCell(Text('Rs.${45 * index + 1}')),
        DataCell(Text('Rs.${45 * (index + 1 * index + 2)}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}
