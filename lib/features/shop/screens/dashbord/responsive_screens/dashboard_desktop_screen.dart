import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/section_title_template.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_counter_section.dart';
import 'package:store/features/shop/screens/dashbord/widgets/dashboard_order_section.dart';
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
                  DashboardCounterSection(),
                  DashboardOrderSection(),
                ],
              ),
              Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: SSectionHeaderTemplate(
                      title: 'Top Products',
                      action: 'Period',
                      child: SizedBox(),
                    ),
                  ),
                  TSizes.spaceBtwItems.width,
                  const Flexible(
                    flex: 3,
                    child: SSectionHeaderTemplate(
                      title: 'Payment Status',
                      action: 'Pending',
                      child: SizedBox(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
