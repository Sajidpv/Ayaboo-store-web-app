import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class BrandSourceRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    DataRow2(cells: [
      const DataCell(SRoundedImage(
        imageType: ImageType.asset,
        width: 50,
        height: 50,
        padding: TSizes.sm,
        image: SImages.darkAppLogo,
        borderRadius: TSizes.borderRadiusMd,
        backgroundColor: TColors.primaryBackground,
      )),
      DataCell(Text('Uracca',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                color: TColors.primary,
              ))),
      const DataCell(Text(
        'HIELTD PVT LTD',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
      const DataCell(Text(
        'HAASH',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
      const DataCell(Text(
        'False',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
      const DataCell(Text(
        'True',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
      const DataCell(Text(
        '28-10-94',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
      const DataCell(Text(
        'Pending',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
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
