import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/chips/choice_chip.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/controller/customer.refund/customer_refund_controller.dart';
import 'package:store/features/shop/screens/customer.refunds/tables/refund.all/refund_replace_table.dart';
import 'package:store/features/shop/screens/customer.refunds/tables/refund/refund_table.dart';
import 'package:store/features/shop/screens/customer.refunds/tables/replace/replace_table.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class RefundTableSection extends StatelessWidget {
  const RefundTableSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CustomerRefundController controller =
        Get.put(CustomerRefundController());
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: SDeviceUtils.isMobileScreen(context)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwItems,
        children: [
          if (!SDeviceUtils.isMobileScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchBox(
                  hint: 'Search by order code',
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 220),
                  child: SortDropDown(
                    onChanged: (p0) {},
                    hint: 'Filter by return status',
                    values: ReturnStatus.values,
                  ),
                )
              ],
            ),
          if (SDeviceUtils.isMobileScreen(context)) ...[
            const SearchBox(
              hint: 'Search by order code',
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 220),
              child: SortDropDown(
                onChanged: (p0) {},
                hint: 'Filter by delivery status',
                values: DeliveryStatus.values,
              ),
            )
          ],
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                border: Border.all(color: TColors.grey),
                borderRadius: BorderRadius.circular(TSizes.defaultSpace)),
            height: 50,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => buildTextChoiceChip(
                      label: RefundTypes.values[index].toString().split('.')[1],
                      selected: controller.selectedRefundType.value ==
                          RefundTypes.values[index],
                      onSelected: (bool value) => controller
                          .changeRefundType(RefundTypes.values[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(() {
            if (controller.selectedRefundType.value == RefundTypes.refund) {
              return const RefundTable();
            } else if (controller.selectedRefundType.value ==
                RefundTypes.replace) {
              return const ReplaceTable();
            } else {
              return const RefundReplaceTable();
            }
          }),
        ],
      ),
    );
  }
}
