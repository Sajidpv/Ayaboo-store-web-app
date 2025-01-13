import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProductReviewSourceRows extends DataTableSource {
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
                color: index == 9 ? Colors.grey.shade300 : Colors.transparent,
                width: index == 10 ? 1.0 : 0),
          ),
        ),
        cells: [
          DataCell(Text(
            '${(index + 1).toString()}.',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Row(
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
                'Odio premium leggings',
                overflow: TextOverflow.ellipsis,
              )),
            ],
          )),
          const DataCell(Text(
            'Nesto hyper market',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(
            Text(
              '9.5 star',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const DataCell(Text(
            'Lorem ipsum dolor sit amet consectetur. Dignissim odio semper vel facilisis diam sit est turpis. Orci adipiscing neque lorem tristique enim elementum. ',
            maxLines: 2,
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
          const DataCell(STableActionButtons(
            delete: true,
            more: false,
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
