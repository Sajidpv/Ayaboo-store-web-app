import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/buttons/material_button.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/common/widgets/inputs/browse_images.dart';
import 'package:store/common/widgets/inputs/build_input_field_with_initial_title.dart';
import 'package:store/features/shop/controller/customer.refund/customer_refund_controller.dart';
import 'package:store/features/shop/screens/customer.refunds/tables/refund.all/refund_items/refund_table.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/spacer_extension.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:store/utils/popups/dialogues.dart';

class RefundReplaceTableSourceRow extends DataTableSource {
  final CustomerRefundController controller =
      Get.find<CustomerRefundController>();

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      // onTap: () =>
      //     controller.selectedRows[index] = !controller.selectedRows[index],
      // selected: controller.selectedRows[index],
      // onSelectChanged: (value) =>
      //     controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text(SHelperFunctions.getFormattedDate(DateTime.now()))),
        const DataCell(Text('459674385976934')),
        const DataCell(Text('459674385976934')),
        const DataCell(Text('Customer')),
        const DataCell(Text('No Reason')),
        DataCell(Text(
          ReturnStatus.ontransist.toString().split('.')[1],
          style: TextStyle(
              color: SHelperFunctions.getReturnStatusColor(
                  ReturnStatus.ontransist)),
        )),
        DataCell(STableActionButtons(
          more: false,
          onViewPressed: () => SDialogues.defaultDialog(
            context: Get.context!,
            content: _buildAlerDialogContent(),
            actions: _buildAlertdialogActions,
          ),
          view: true,
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 22;

  @override
  int get selectedRowCount => 0;

  List<Widget> get _buildAlertdialogActions {
    return [
      if (controller.selectedRefundType.value == RefundTypes.refund ||
          controller.selectedRefundType.value == RefundTypes.replace)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButtonWidget(
                color: TColors.primary,
                textColor: TColors.white,
                onPressed: () {},
                title: controller.selectedRefundType.value == RefundTypes.refund
                    ? 'Refund Approved'
                    : 'Replaced'),
          ],
        ),
      if (controller.selectedRefundType.value == RefundTypes.all)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: SCustomDropDown(
                onChanged: (p0) {},
                hint: 'Choose ',
                values: ReturnTypes.values,
              ),
            ),
            if (!SDeviceUtils.isMobileScreen(Get.context!))
              Row(
                spacing: TSizes.defaultSpace,
                children: [
                  MaterialButtonWidget(
                      color: TColors.error,
                      textColor: TColors.white,
                      onPressed: () {},
                      title: 'Reject'),
                  MaterialButtonWidget(
                      color: TColors.success,
                      textColor: TColors.white,
                      onPressed: () {},
                      title: 'Approve'),
                ],
              ),
          ],
        ),
      if (SDeviceUtils.isMobileScreen(Get.context!) &&
          controller.selectedRefundType.value == RefundTypes.all) ...[
        10.height,
        Row(
          spacing: TSizes.defaultSpace,
          children: [
            MaterialButtonWidget(
                color: TColors.error,
                textColor: TColors.white,
                onPressed: () {},
                title: 'Reject'),
            MaterialButtonWidget(
                color: TColors.success,
                textColor: TColors.white,
                onPressed: () {},
                title: 'Approve'),
          ],
        ),
      ]
    ];
  }

  Widget _buildAlerDialogContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: TSizes.sm,
      children: [
        if (controller.selectedRefundType.value == RefundTypes.refund ||
            controller.selectedRefundType.value == RefundTypes.replace)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: TSizes.spaceBtwInputFields,
                children: [
                  const Text('OnTransist'),
                  buildInputFieldWithInitialTitle(
                    text: 'Shipping partner name',
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  buildInputFieldWithInitialTitle(
                    text: 'LR.Number',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'LR.No'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('LR Photo'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Return bill'),
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
                    text: 'Shipping Date',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Date'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (controller.selectedRefundType.value == RefundTypes.refund ||
            controller.selectedRefundType.value == RefundTypes.replace)
          const Divider(),
        Text(
          '84375894376845',
          style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
                color: TColors.darkGrey,
              ),
        ),
        Text(
          'Return Details',
          style: Theme.of(Get.context!).textTheme.headlineMedium,
        ),
        Text(
          'name\nMalayamma post, 76576, \nCalicut, Kerala\nGst: FDG436456363FGDS\nPhone:84376974596',
          style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
                color: TColors.blackAccent,
              ),
        ),
        const Divider(),
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
          child: RefundTable(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: Rs.1000',
              style: Theme.of(Get.context!).textTheme.headlineSmall,
            ),
            _viewTaxDetails()
          ],
        ),
        TextFormField(
          maxLines: 5,
          decoration:
              const InputDecoration(hintText: 'Reason for return/refund'),
        ),
        if (controller.selectedRefundType.value == RefundTypes.refund)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Form(
              child: Column(
                spacing: TSizes.spaceBtwInputFields,
                children: [
                  buildInputFieldWithInitialTitle(
                    text: 'Shipping partner name',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                  ),
                  buildInputFieldWithInitialTitle(
                    text: 'LR.Number',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'LR.No'),
                    ),
                  ),
                  buildInputFieldWithInitialTitle(
                      text: 'LR Photo',
                      child: const SBrowsImages(
                        containerColor: TColors.black,
                        textColor: TColors.white,
                      )),
                  buildInputFieldWithInitialTitle(
                      text: 'Return bill pdf',
                      child: const SBrowsImages(
                        containerColor: TColors.black,
                        textColor: TColors.white,
                      )),
                  buildInputFieldWithInitialTitle(
                    text: 'Shipping Date',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Date'),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

Widget _viewTaxDetails() {
  return PopupMenuButton<int>(
    color: TColors.white,
    onSelected: (value) {
      if (value == 0) {
      } else if (value == 1) {
        // Handle "Download"
      } else if (value == 2) {
        // Handle "Cancel Order"
      } else if (value == 3) {
        // Handle "Cancel Order"
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 0,
        child: Text('IGST'),
      ),
      const PopupMenuItem(
        value: 1,
        child: Text('SGST'),
      ),
      const PopupMenuItem(
        value: 2,
        child: Text('CGST'),
      ),
      const PopupMenuItem(
        value: 2,
        child: Text('CESS'),
      ),
    ],
    child: TextButton(
        onPressed: () {},
        child: const Text(
          'View tax details',
        )),
  );
}
