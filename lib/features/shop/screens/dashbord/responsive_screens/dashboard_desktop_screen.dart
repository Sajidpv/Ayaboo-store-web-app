import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/section_title_template.dart';
import 'package:store/features/shop/screens/dashbord/components/dashboard_recent_orders.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_counter_section.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_order_section.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_order_status_piechart_widget.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_weekly_graph_widget.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwSections,
            children: [
              const Row(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Expanded(flex: 2, child: DashboardCounterSection()),
                  DashboardOrderSection(),
                ],
              ),
              ///////////////GRAPHS////////
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TSizes.spaceBtwItems,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      spacing: TSizes.spaceBtwItems,
                      children: [
                        ///BarGRAPH
                        DashboardWeeklyGraphWidget(),

                        ///Recent orders
                        DashboardRecentOrder()
                      ],
                    ),
                  ),

                  ///////PIE
                  Expanded(child: DashboardOrderStatusPiechartWidget())
                ],
              ),
              //////CARDS/////////////////
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: SSectionHeaderTemplate(
                      title: Text(
                        'Top Products',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      action: 'Period',
                      child: const SizedBox(),
                    ),
                  ),
                  TSizes.spaceBtwItems.width,
                  Flexible(
                    flex: 3,
                    child: SSectionHeaderTemplate(
                      title: Text(
                        'Payment Status',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      action: 'Pending',
                      child: const SizedBox(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
