import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/customer.refunds/tables/refund_table_section.dart';
import 'package:store/utils/constants/sizes.dart';

class CustomerRefundsDesktopTabletScreen extends StatelessWidget {
  const CustomerRefundsDesktopTabletScreen({super.key});

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
                breadcrumbItems: ['Customer Refunds'],
                heading: 'Customer Refunds',
              ),
              SContainerWidget(
                child: RefundTableSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
