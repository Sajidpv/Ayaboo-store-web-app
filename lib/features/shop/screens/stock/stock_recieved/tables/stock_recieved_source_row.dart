import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/buttons/material_button.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/common/widgets/inputs/build_input_field_with_initial_title.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:store/utils/popups/dialogues.dart';

class StockRecievedSourceRow extends DataTableSource {
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
            SHelperFunctions.getFormattedDate(DateTime.now()),
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '45364-3426',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Calicut store',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '250 Piece',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Compeleted',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(STableActionButtons(
            more: false,
            view: true,
            onViewPressed: () => SDialogues.defaultDialog(
              context: Get.context!,
              content: _buildAlerDialogContent(),
              actions: _buildAlertdialogActions,
            ),
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

List<Widget> get _buildAlertdialogActions {
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
          title: 'Recieve',
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

Widget _buildAlerDialogContent() {
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
                'Stock Recived',
                style: Theme.of(Get.context!).textTheme.headlineSmall,
              ),
              buildInputFieldWithInitialTitle(
                text: 'From',
                child: SCustomDropDown(
                  onChanged: (p0) {},
                  hint: 'Select store',
                  values: const ['store1', 'store 2'],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('Bill/Delivery Challan'),
                  ),
                  Stack(
                    children: [
                      SRoundedImage(
                        width: 50,
                        height: 50,
                        borderRadius: TSizes.buttonMinimumRadius,
                        border: Border.all(color: TColors.borderPrimary),
                        imageType: ImageType.asset,
                        image: SImages.darkAppLogo,
                      ),
                      const Positioned(
                          left: 12,
                          top: 12,
                          child: Icon(Icons.remove_red_eye_outlined))
                    ],
                  )
                ],
              ),
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
