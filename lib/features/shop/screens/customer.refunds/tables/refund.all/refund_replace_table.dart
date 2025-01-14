import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:store/common/widgets/data_table/paginated_data_table.dart';

import 'package:store/features/shop/screens/customer.refunds/tables/refund.all/refund_replace_table_source_row.dart';

class RefundReplaceTable extends StatelessWidget {
  const RefundReplaceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
        minWidth: 786,
        tableHeight: 750,
        dataRowHeight: 70,
        columns: const [
          DataColumn2(
            label: Text(
              'Date',
            ),
          ),
          DataColumn2(
            label: Text('Return ID'),
          ),
          DataColumn2(
            label: Text('Against Order ID'),
          ),
          DataColumn2(
            label: Text('Customer'),
          ),
          DataColumn2(
            label: Text('Reason'),
          ),
          DataColumn2(
            label: Text('Status'),
          ),
          DataColumn2(
            label: Text('Actions'),
          ),
        ],
        source: RefundReplaceTableSourceRow());
  }
}
