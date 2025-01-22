import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controller/reports/report_controller.dart';

class PaginatedExpandableTable extends StatefulWidget {
  @override
  _PaginatedExpandableTableState createState() =>
      _PaginatedExpandableTableState();
}

class _PaginatedExpandableTableState extends State<PaginatedExpandableTable> {
  final List<Map<String, dynamic>> _data = List.generate(
    50,
    (index) => {
      'id': index + 1,
      'name': 'Item ${index + 1}',
      'details': 'Detail of Item ${index + 1}',
    },
  );

  int _rowsPerPage = 5; // Ensure this is part of availableRowsPerPage

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: Text('Expandable Table with Pagination'),
      rowsPerPage: _rowsPerPage,
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value!;
        });
      },
      availableRowsPerPage: [5, 10, 25, 50], // Ensure 5 is included
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Details')),
      ],
      source: _DataTableSource(_data),
    );
  }
}

class _DataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _DataTableSource(this._data);
  final Rx<Map<int, bool>> expandedRow = Rx<Map<int, bool>>({
    for (int i = 0; i < 50; i++) i: false,
  });
  @override
  DataRow getRow(int index) {
    final row = _data[index];
    final isExpanded = expandedRow.value[index] ?? false;

    return DataRow(cells: [
      DataCell(Text(row['id'].toString())),
      DataCell(Text(row['name'])),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Text(isExpanded ? row['details'] : 'Tap to expand')),
            IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                // Toggle the expansion state, and ensure the key exists
                expandedRow.value[index] = !(expandedRow.value[index] ?? false);
              },
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
