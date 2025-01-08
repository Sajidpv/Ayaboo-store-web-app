import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/dashbord/tables/table_source.dart';
import 'package:store/utils/constants/sizes.dart';

class DashboardOrderTableWidget extends StatelessWidget {
  const DashboardOrderTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
        minWidth: 700,
        tableHeight: 500,
        dataRowHeight: TSizes.xl * 1.2,
        source: OrderRow(),
        columns: const [
          DataColumn2(label: Text('OrderId')),
          DataColumn2(label: Text('Date')),
          DataColumn2(label: Text('Item')),
          DataColumn2(label: Text('Status')),
          DataColumn2(label: Text('Amount')),
        ]);
  }
}
