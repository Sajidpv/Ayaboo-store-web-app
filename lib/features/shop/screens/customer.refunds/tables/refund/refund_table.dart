import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:store/common/widgets/data_table/paginated_data_table.dart';

import 'package:store/features/shop/screens/customer.refunds/tables/refund/refund_table_source_row.dart';

class RefundTable extends StatelessWidget {
  const RefundTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
        minWidth: 490,
        tableHeight: 750,
        dataRowHeight: 70,
        columns: const [
          DataColumn2(
            label: Text(
              'Varients',
            ),
          ),
          DataColumn2(
            label: Text('Price'),
          ),
          DataColumn2(
            label: Text('Return quantity'),
          ),
        ],
        source: RefundTableSourceRow());
  }
}
