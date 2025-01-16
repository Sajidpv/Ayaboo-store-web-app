import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';
import 'package:store/features/shop/screens/stock/stock_requests/widgets/stock_request_form.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:store/utils/popups/dialogues.dart';

class StockRequestSourceRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final double screenWidth = Get.context!.width;
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
            'Odio bgrl',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Leggings',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Pending',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(STableActionButtons(
            more: false,
            view: true,
            onViewPressed: () => SDialogues.defaultDialog(
              context: Get.context!,
              content: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: screenWidth > 600 ? 600 : screenWidth * 0.9,
                  ),
                  child: const StockRequestForm()),
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
