import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/screens/stock/stock_requests/tables/stock_request_source_row.dart';

class StockRequestTable extends StatelessWidget {
  const StockRequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(
            hint: 'Search by store name',
          ),
          SPaginatedDataTable(
            tableHeight: 760,
            minWidth: 700,
            columns: const [
              DataColumn2(label: Text('Date'), fixedWidth: 150),
              DataColumn2(
                label: Text(
                  'Store',
                ),
              ),
              DataColumn2(
                label: Text('Request'),
              ),
              DataColumn2(
                label: Text('Status'),
              ),
              DataColumn2(label: Text('Actions'), fixedWidth: 70),
            ],
            source: StockRequestSourceRow(),
          ),
        ],
      ),
    );
  }
}
