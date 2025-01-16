import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class UserSearchesTableSourceRow extends DataTableSource {
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
            (index + 1).toString(),
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Latest trending girls leggin',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Center(
            child: Text(
              '1342',
              overflow: TextOverflow.ellipsis,
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
