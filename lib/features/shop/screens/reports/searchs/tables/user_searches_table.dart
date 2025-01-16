import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/screens/reports/searchs/tables/user_searches_table_source_row.dart';

class UserSearchesTable extends StatelessWidget {
  const UserSearchesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(
            hint: 'Search by keyword',
          ),
          SPaginatedDataTable(
            tableHeight: 760,
            minWidth: 700,
            columns: const [
              DataColumn2(label: Text('#'), fixedWidth: 50),
              DataColumn2(
                label: Text('Search Keyword'),
              ),
              DataColumn2(label: Text('Number of Strikes'), fixedWidth: 150),
            ],
            source: UserSearchesTableSourceRow(),
          ),
        ],
      ),
    );
  }
}
