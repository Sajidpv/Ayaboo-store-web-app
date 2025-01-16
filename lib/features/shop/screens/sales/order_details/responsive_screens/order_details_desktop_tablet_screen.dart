import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/sales/order_details/components/build_header_details_row_component.dart';
import 'package:store/features/shop/screens/sales/order_details/components/build_sort_title_component.dart';
import 'package:store/features/shop/screens/sales/order_details/components/build_text_sections.dart';
import 'package:store/features/shop/screens/sales/order_details/components/qrcode_section.dart';
import 'package:store/features/shop/screens/sales/order_details/tables/order_details_table.dart';
import 'package:store/features/shop/screens/sales/order_details/widgets/order_details_amount_calculation_section.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class OrderDetailsDesktopTabMobileScreen extends StatelessWidget {
  const OrderDetailsDesktopTabMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: const [SRoutes.orders, 'Order Details'],
                heading: 'Orders Details',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              _buildSortSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(flex: 1, child: QrcodeSection()),
                  Flexible(
                    flex: 1,
                    child: BuildOrderDetailsHeaderRowComponent(
                      title: 'Customer',
                      icon: Icons.person,
                      child: Text(
                          'Sulfiker\nPanakkad, Ayikode south, Kerala-676542,India',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: BuildOrderDetailsHeaderRowComponent(
                      title: 'Order Info',
                      icon: Icons.receipt,
                      child: buildProductDescriptionDetails(
                        title: 'Status',
                        value: DeliveryStatus.pending
                            .toString()
                            .split('.')[1]
                            .capitalize!,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: BuildOrderDetailsHeaderRowComponent(
                      title: 'Payment Info',
                      icon: Icons.payments_rounded,
                      child: Column(
                        children: [
                          buildProductDescriptionDetails(
                            title: 'Status',
                            value: PaymentStatus.paid
                                .toString()
                                .split('.')[1]
                                .capitalize!,
                          ),
                          buildProductDescriptionDetails(
                            title: 'Status',
                            value: PaymentMethods.creditCard
                                .toString()
                                .split('.')[1]
                                .capitalize!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                spacing: TSizes.spaceBtwItems,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: SContainerWidget(
                        child: OrderDetailsTable(),
                      )),
                  Expanded(
                      flex: 1,
                      child: OrderDetailsAmountCalculationSectionComponent())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSortSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    spacing: TSizes.spaceBtwItems,
    children: [
      Column(
        spacing: TSizes.xs,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSortTitle(text: ' Assign delivery partner'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: SCustomDropDown(
              hint: 'Assign to Logistics',
              onChanged: (p0) {},
              values: VerificationStatus.values,
            ),
          ),
        ],
      ),
      Column(
        spacing: TSizes.xs,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSortTitle(text: ' Payment Status'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: SCustomDropDown(
              hint: 'Payment Status',
              onChanged: (p0) {},
              values: PaymentStatus.values,
            ),
          ),
        ],
      ),
      Column(
        spacing: TSizes.xs,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSortTitle(text: ' Delivery Status'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: SCustomDropDown(
              hint: 'Delivery Status',
              onChanged: (p0) {},
              values: DeliveryStatus.values,
            ),
          ),
        ],
      ),
    ],
  );
}
