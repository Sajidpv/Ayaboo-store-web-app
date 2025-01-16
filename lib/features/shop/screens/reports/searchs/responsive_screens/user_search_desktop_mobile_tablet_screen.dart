import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/reports/searchs/tables/user_searches_table.dart';
import 'package:store/utils/constants/sizes.dart';

class UserSearchDesktopMobileTabletScreen extends StatelessWidget {
  const UserSearchDesktopMobileTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: ['Reports/User searches'],
                heading: 'User Searches',
              ),
              UserSearchesTable()
            ],
          ),
        ),
      ),
    );
  }
}
