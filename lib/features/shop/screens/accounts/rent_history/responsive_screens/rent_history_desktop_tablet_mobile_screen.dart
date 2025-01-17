import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/accounts/rent_history/tables/rent_table.dart';
import 'package:store/features/shop/screens/accounts/widgets/AccountsEraningCountBannerWidget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class RentHistoryDesktopTabletMobileScreen extends StatelessWidget {
  const RentHistoryDesktopTabletMobileScreen({super.key});

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
                  children: [
                    const SBreadcrumbsWithHeading(
                      breadcrumbItems: ['Accounts / Rents'],
                      heading: 'Rent History',
                    ),
                    if (!SDeviceUtils.isMobileScreen(context))
                      Flexible(
                        child: Row(
                          spacing: TSizes.defaultSpace,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: SearchBox(
                                hint: 'Search by Seller/id',
                              ),
                            ),
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
                            )
                          ],
                        ),
                      ),
                  ],
                ),
                if (SDeviceUtils.isMobileScreen(context)) ...[
                  const SearchBox(
                    hint: 'Search by Seller/Id',
                  ),
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
                  title: 'Total Rent Earned',
                  count: 2500,
                ),
                const RentTable(),
              ]),
        ),
      ),
    );
  }
}
