import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/stock/stock_recieved/tables/stock_recieved_table.dart';
import 'package:store/utils/constants/sizes.dart';

class StockRecivedDesktopMobileTabletScreen extends StatelessWidget {
  const StockRecivedDesktopMobileTabletScreen({super.key});

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
                breadcrumbItems: ['Stock-recieved'],
                heading: 'Recieved Stock',
              ),
              StockRecievedTable()
            ],
          ),
        ),
      ),
    );
  }
}
