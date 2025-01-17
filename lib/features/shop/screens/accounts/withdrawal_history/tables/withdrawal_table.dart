import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/accounts/withdrawal_history/tables/withrawel_source_row.dart';
import 'package:store/utils/constants/sizes.dart';

class WithdrawalTable extends StatelessWidget {
  const WithdrawalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                label: Text('Amount'),
              ),
              DataColumn2(
                label: Text('Status'),
              ),
              DataColumn2(
                label: Text('Remark'),
              ),
            ],
            source: WithrawelSourceRow(),
          ),
        ],
      ),
    );
  }
}
