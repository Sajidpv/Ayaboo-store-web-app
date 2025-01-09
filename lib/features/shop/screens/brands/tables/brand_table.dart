import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/screens/brands/tables/brand_source_rows.dart';
import 'package:store/utils/device/device_utility.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SPaginatedDataTable(
      minWidth: 700,
      tableHeight: 760,
      dataRowHeight: 64,
      columns: [
        DataColumn2(
            label: const Text('Logo'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Brand'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Seller name'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Owner name'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Published'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Featured'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Date'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Status'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(
            label: const Text('Actions'),
            fixedWidth: SDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
      ],
      source: BrandSourceRows(),
    );
  }
}
