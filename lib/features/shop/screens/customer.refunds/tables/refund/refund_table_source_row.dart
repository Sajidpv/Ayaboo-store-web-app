import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

import 'package:store/utils/helpers/helper_functions.dart';

class RefundTableSourceRow extends DataTableSource {
  final SalesController controller = Get.put(SalesController());

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      onTap: () =>
          controller.selectedRows[index] = !controller.selectedRows[index],
      selected: controller.selectedRows[index],
      // onSelectChanged: (value) =>
      //     controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
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
              Text(
                'Sx2 items',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(Get.context!).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const DataCell(Text('Rs. 234')),
        DataCell(SizedBox(
            width: 100,
            child: TextFormField(
              readOnly: true,
            ))),
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
