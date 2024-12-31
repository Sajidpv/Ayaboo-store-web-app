import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/controller/sales_controller.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class SalesDesktopScreen extends StatelessWidget {
  const SalesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesController controller = Get.put(SalesController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.lg),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchController,
                onChanged: controller.search,
                decoration: const InputDecoration(
                    hintText: 'Search..',
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
              TSizes.spaceBtwSections.height,
              Obx(() {
                Visibility(
                    visible: false,
                    child: Text(controller.filteredDataList.length.toString()));
                return SPaginatedDataTable(
                    minWidth: 786,
                    dataRowHeight: 56,
                    ///////pagination
                    rowsPerPage: 13,
                    onPageChanged: (value) {}, //action while change a pag

                    /////////SORTING///////////
                    sortAscending: controller.sortAsce.value,
                    sortColumnIndex: controller.sortColumnIndex.value,
                    columns: [
                      const DataColumn2(
                        label: Text('label'),
                      ),
                      DataColumn2(
                        label: const Text(
                          'label',
                        ),
                        onSort: (columnIndex, ascending) =>
                            controller.sortByIndex(columnIndex, ascending),
                      ),
                      const DataColumn2(
                        label: Text('label'),
                      ),
                      DataColumn2(
                        label: const Text('label'),
                        onSort: (columnIndex, ascending) =>
                            controller.sortByIndex(columnIndex, ascending),
                      ),
                    ],
                    source: SalesDataSource());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesDataSource extends DataTableSource {
  final SalesController controller = Get.put(SalesController());

  @override
  DataRow? getRow(int index) {
    final data = controller.filteredDataList[index];
    return DataRow2(
      onTap: () =>
          controller.selectedRows[index] = !controller.selectedRows[index],
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text(data['Column1'] ?? '')),
        DataCell(Text(data['Column2'] ?? '')),
        DataCell(Text(data['Column3'] ?? '')),
        DataCell(Text(data['Column4'] ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}
