import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/utils/constants/enums.dart';

import 'package:store/utils/helpers/helper_functions.dart';

class ReplaceTableSourceRow extends DataTableSource {
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
        DataCell(Text(SHelperFunctions.getFormattedDate(
            DateTime.now().add(const Duration(days: 1))))),
        const DataCell(Text('459674385976934')),
        const DataCell(Text('459674385976934')),
        const DataCell(Text('Customer1')),
        const DataCell(Text('No reason')),
        DataCell(Text(
          ReturnStatus.rejected.toString().split('.')[1],
          style: TextStyle(
              color:
                  SHelperFunctions.getReturnStatusColor(ReturnStatus.rejected)),
        )),
        const DataCell(STableActionButtons(
          more: false,
          view: true,
        )),
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
