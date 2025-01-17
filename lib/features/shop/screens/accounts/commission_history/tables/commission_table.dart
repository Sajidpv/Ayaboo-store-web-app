import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/accounts/commission_history/tables/commission_table_source_row.dart';
import 'package:store/utils/constants/sizes.dart';

class CommissionTable extends StatelessWidget {
  const CommissionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SPaginatedDataTable(
            tableHeight: 760,
            minWidth: 700,
            columns: const [
              DataColumn2(label: Text('Date'), fixedWidth: 150),
              DataColumn2(
                label: Text(
                  'Order Id',
                ),
              ),
              DataColumn2(
                label: Text('Bill amount'),
              ),
              DataColumn2(
                label: Text('Commission'),
              ),
              DataColumn2(
                label: Text('Status'),
              ),
            ],
            source: CommissionTableSourceRow(),
          ),
        ],
      ),
    );
  }
}
