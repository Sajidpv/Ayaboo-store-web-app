import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/brands/tables/brand_source_rows.dart';
import 'package:store/utils/constants/colors.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
      headerColor: TColors.white,
      tableHeight: 640,
      dataRowHeight: 64,
      columns: const [
        DataColumn2(label: Text('#'), fixedWidth: 40),
        DataColumn2(
          label: Text('Brand'),
        ),
        DataColumn2(label: Text('Logo'), fixedWidth: 70),
        DataColumn2(
          label: Text('TM number'),
        ),
        DataColumn2(
          label: Text('Owner name'),
        ),
        DataColumn2(
          label: Text('Featured'),
        ),
        DataColumn2(
          label: Text('Date'),
        ),
        DataColumn2(
          label: Text('Status'),
        ),
        DataColumn2(
          label: Text('Actions'),
        ),
      ],
      source: BrandSourceRows(),
    );
  }
}
