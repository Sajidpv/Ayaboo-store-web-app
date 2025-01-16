import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/stock/stock_requests/tables/stock_request_table.dart';
import 'package:store/features/shop/screens/stock/stock_requests/widgets/stock_request_form.dart';
import 'package:store/utils/constants/sizes.dart';

class StockRequestDesktopScreen extends StatelessWidget {
  const StockRequestDesktopScreen({super.key});

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
                breadcrumbItems: ['Stock-request'],
                heading: 'Stock Requests',
              ),
              Row(
                spacing: TSizes.defaultSpace,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: SContainerWidget(child: StockRequestTable()),
                  ),
                  Expanded(
                    flex: 2,
                    child: SContainerWidget(child: StockRequestForm()),
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
