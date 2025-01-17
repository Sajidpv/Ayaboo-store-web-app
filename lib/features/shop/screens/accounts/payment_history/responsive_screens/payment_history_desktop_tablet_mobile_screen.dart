import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/accounts/payment_history/tables/payment_history_table.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class PaymentHistoryDesktopTabletMobileScreen extends StatelessWidget {
  const PaymentHistoryDesktopTabletMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.defaultSpace,
            children: [
              Row(
                spacing: TSizes.defaultSpace,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SBreadcrumbsWithHeading(
                    breadcrumbItems: ['Accounts / Payments'],
                    heading: 'Payment History',
                  ),
                  if (!SDeviceUtils.isMobileScreen(context))
                    Flexible(
                      child: Row(
                        spacing: TSizes.defaultSpace,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: SearchBox(
                              hint: 'Search by Id',
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: SCustomDropDown(
                              values: const [
                                'Today',
                                'This Week',
                                'This Month',
                                'Last Year'
                              ],
                              hint: 'Filter by date',
                              onChanged: (p0) {},
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              if (SDeviceUtils.isMobileScreen(context)) ...[
                const SearchBox(
                  hint: 'Search by Id',
                ),
                SCustomDropDown(
                  values: const [
                    'Today',
                    'This Week',
                    'This Month',
                    'Last Year'
                  ],
                  hint: 'Filter by date',
                  onChanged: (p0) {},
                ),
              ],
              const PaymentHistoryTable()
            ],
          ),
        ),
      ),
    );
  }
}
