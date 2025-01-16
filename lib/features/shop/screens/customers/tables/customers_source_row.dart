import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/data_table/table_action_buttons.dart';

class CustomersSourceRow extends DataTableSource {
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
        cells: const [
          DataCell(Text(
            'Safwan',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'Safwan@haash.com',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            '975683475384',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'FDH453745RDG',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            '673546',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'Odio cradle',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'Kattangal',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'Kerala',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(Text(
            'India',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(STableActionButtons()),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
