import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/dashbord/tables/dashboard_order_table_widget.dart';
import 'package:store/utils/constants/sizes.dart';

class DashboardRecentOrder extends StatelessWidget {
  const DashboardRecentOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: .2,
      padding: const EdgeInsets.all(TSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwSections,
        children: [
          Text(
            'Recent Orders',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const DashboardOrderTableWidget()
        ],
      ),
    );
  }
}
