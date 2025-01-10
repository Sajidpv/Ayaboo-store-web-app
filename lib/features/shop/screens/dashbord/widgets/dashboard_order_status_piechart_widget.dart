import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/controller/dashboard/dashboard_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class DashboardOrderStatusPiechartWidget extends StatelessWidget {
  const DashboardOrderStatusPiechartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return SContainerWidget(
      elevation: .2,
      padding: const EdgeInsets.all(TSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwSections,
        children: [
          Text(
            'Order Status',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                  sections: controller.orderStatusData.entries.map(
                    (entery) {
                      final status = entery.key;

                      final count = entery.value;
                      return PieChartSectionData(
                          radius: 100,
                          title: count.toString(),
                          value: count.toDouble(),
                          color: SHelperFunctions.getDefaultStatusColor(status),
                          titleStyle: const TextStyle(
                              color: TColors.white,
                              fontSize: TSizes.md,
                              fontWeight: FontWeight.bold));
                    },
                  ).toList(),
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                      enabled: true)),
            ),
          ),

          ////show pie data details
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Order')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map(
                (entry) {
                  final DefaultStatus status = entry.key;
                  final int count = entry.value;
                  final totalAmount = controller.totalAmounts[status] ?? 0;
                  return DataRow(cells: [
                    DataCell(
                      Row(
                        spacing: TSizes.spaceBtwItems,
                        children: [
                          SContainerWidget(
                            width: 20,
                            height: 20,
                            backgroundColor:
                                SHelperFunctions.getDefaultStatusColor(status),
                          ),
                          Expanded(
                              child: Text(status
                                      .toString()
                                      .split('.')[1]
                                      .capitalizeFirst ??
                                  ''))
                        ],
                      ),
                    ),
                    DataCell(Text(count.toString())),
                    DataCell(Text(totalAmount.toStringAsFixed(2)))
                  ]);
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
