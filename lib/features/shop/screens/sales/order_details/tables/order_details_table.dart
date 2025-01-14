import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/features/shop/screens/sales/order_details/tables/order_details_table_source_row.dart';
import 'package:store/utils/constants/sizes.dart';

class OrderDetailsTable extends StatelessWidget {
  const OrderDetailsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SalesController controller = Get.put(SalesController());
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: TSizes.spaceBtwItems,
        children: [
          Obx(() {
            Visibility(
                visible: false,
                child: Text(controller.filteredDataList.length.toString()));
            return SPaginatedDataTable(
                minWidth: 786,
                tableHeight: 500,
                dataRowHeight: 70,
                columns: const [
                  DataColumn2(label: Text('#'), fixedWidth: 40),
                  DataColumn2(
                    label: Text(
                      'Products',
                    ),
                  ),
                  DataColumn2(
                    label: Text('Delivery type'),
                  ),
                  DataColumn2(
                    label: Text('Quantity'),
                  ),
                  DataColumn2(
                    label: Text('Price'),
                  ),
                  DataColumn2(
                    label: Text('Total'),
                  ),
                ],
                source: OrderDetailsTableSourceRow());
          }),
        ],
      ),
    );
  }
}
