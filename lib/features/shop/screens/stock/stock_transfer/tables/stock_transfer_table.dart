import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/screens/stock/stock_transfer/tables/stock_transfer_source_row.dart';
import 'package:store/utils/constants/sizes.dart';

class StockTransferTable extends StatelessWidget {
  const StockTransferTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(
            hint: 'Search by name or email',
          ),
          SPaginatedDataTable(
            tableHeight: 760,
            columns: const [
              DataColumn2(label: Text('Date'), fixedWidth: 150),
              DataColumn2(
                label: Text(
                  'Transfer ID',
                ),
              ),
              DataColumn2(
                label: Text('to Store'),
              ),
              DataColumn2(
                label: Text('Quantity'),
              ),
              DataColumn2(
                label: Text('Status'),
              ),
              DataColumn2(label: Text('Actions'), fixedWidth: 70),
            ],
            source: StockTransferSourceRow(),
          ),
        ],
      ),
    );
  }
}
