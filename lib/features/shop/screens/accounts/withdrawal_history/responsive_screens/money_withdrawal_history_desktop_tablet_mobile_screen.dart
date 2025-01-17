import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/accounts/widgets/AccountsEraningCountBannerWidget.dart';
import 'package:store/features/shop/screens/accounts/withdrawal_history/tables/withdrawal_table.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class MoneyWithdrawalHistoryDesktopTabletMobileScreen extends StatelessWidget {
  const MoneyWithdrawalHistoryDesktopTabletMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
              spacing: TSizes.defaultSpace / 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: TSizes.defaultSpace,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SBreadcrumbsWithHeading(
                      breadcrumbItems: ['Accounts / withdrawals'],
                      heading: 'Money Withdrawal History',
                    ),
                    if (!SDeviceUtils.isMobileScreen(context))
                      SizedBox(
                        width: 150,
                        child: SCustomDropDown(
                          values: const [
                            'Today',
                            'This Week',
                            'Six Month',
                            'Last Year'
                          ],
                          hint: 'Period',
                          onChanged: (p0) {},
                        ),
                      ),
                  ],
                ),
                if (SDeviceUtils.isMobileScreen(context)) ...[
                  SCustomDropDown(
                    values: const [
                      'Today',
                      'This Week',
                      'Six Month',
                      'Last Year'
                    ],
                    hint: 'Period',
                    onChanged: (p0) {},
                  ),
                ],
                const AccountEarningCountBannerWidget(
                  title: 'Balance Amount',
                  count: 5000,
                ),
                const WithdrawalTable(),
              ]),
        ),
      ),
    );
  }
}
