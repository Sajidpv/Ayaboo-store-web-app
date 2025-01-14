import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class OrderTableSourceRow extends DataTableSource {
  final SalesController controller = Get.put(SalesController());

  @override
  DataRow? getRow(int index) {
    final data = controller.filteredDataList[index];
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
      onTap: () =>
          controller.selectedRows[index] = !controller.selectedRows[index],
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text(data['Column1'] ?? '')),
        DataCell(Text(data['Column2'] ?? '')),
        DataCell(Text(data['Column3.1'] ?? '')),
        DataCell(Text(data['Column3'] ?? '')),
        DataCell(Text(data['Column4'] ?? '')),
        DataCell(
          SContainerWidget(
            radius: TSizes.cardRadiusXs,
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs, horizontal: TSizes.md),
            backgroundColor:
                SHelperFunctions.getDeliveryStatusColor(data['Column5'])
                    .withValues(alpha: .1),
            child: Text(
              data['Column5'].toString().split('.')[1],
              style: TextStyle(
                  color:
                      SHelperFunctions.getDeliveryStatusColor(data['Column5'])),
            ),
          ),
        ),
        DataCell(Text(data['Column6'] ?? '')),
        DataCell(SContainerWidget(
            radius: TSizes.cardRadiusXs - 2,
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs, horizontal: TSizes.md),
            backgroundColor:
                SHelperFunctions.getPaymentStatusColor(data['Column7']),
            child: Text(data['Column7'].toString().split('.')[1],
                style: const TextStyle(color: TColors.white)))),
        DataCell(Text(data['Column8'] ?? '')),
        DataCell(
          _saleTableMoreAction(),
        ),
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

Widget _saleTableMoreAction() {
  return PopupMenuButton<int>(
    color: TColors.white,
    onSelected: (value) {
      if (value == 0) {
        Get.toNamed(SRoutes.orderDetails);
      } else if (value == 1) {
        // Handle "Download"
      } else if (value == 2) {
        // Handle "Cancel Order"
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 0,
        child: Text('View'),
      ),
      const PopupMenuItem(
        value: 1,
        child: Text('Download'),
      ),
      const PopupMenuItem(
        value: 2,
        child: Text('Cancel Order'),
      ),
    ],
    child: const Icon(Icons.more_horiz),
  );
}
