import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/products/products/tables/product_source_row.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
      tableHeight: 760,
      dataRowHeight: 64,
      columns: const [
        DataColumn2(label: Text('#'), fixedWidth: 40),
        DataColumn2(
            label: Text(
              'Product',
            ),
            size: ColumnSize.L),
        DataColumn2(label: Text('Varient')),
        DataColumn2(
          label: Text('Seller'),
        ),
        DataColumn2(
          label: Text('Total Stock'),
        ),
        DataColumn2(
          label: Text('Discount'),
        ),
        DataColumn2(
          label: Text('Selling Price'),
        ),
        DataColumn2(
          label: Text('Price/Pieces'),
        ),
        DataColumn2(
          label: Text('Sample Price'),
        ),
        DataColumn2(
          label: Text('MRP'),
        ),
        DataColumn2(
          label: Text('Status'),
        ),
        DataColumn2(
          label: Text('Todays deal'),
        ),
        DataColumn2(
          label: Text('Published'),
        ),
        DataColumn2(
          label: Text('Featured'),
        ),
        DataColumn2(
          label: Text('Actions'),
        ),
      ],
      source: ProductSourceRow(),
    );
  }
}
