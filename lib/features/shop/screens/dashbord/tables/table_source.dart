import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/controller/dashboard/dashboard_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class OrderRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(cells: [
      DataCell(Text(
        order.id,
        style: Theme.of(Get.context!)
            .textTheme
            .bodyLarge!
            .apply(color: TColors.primary),
      )),
      DataCell(Text(
        order.formattedOrderDate,
      )),
      const DataCell(Text(
        '5 Items',
      )),
      DataCell(
        SContainerWidget(
          radius: TSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.xs, horizontal: TSizes.md),
          backgroundColor: SHelperFunctions.getDeliveryStatusColor(order.status)
              .withValues(alpha: .1),
          child: Text(
            order.status.name.capitalize.toString(),
            style: TextStyle(
                color: SHelperFunctions.getDeliveryStatusColor(order.status)),
          ),
        ),
      ),
      DataCell(Text(
        '\$${order.totalAmount}',
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
}
