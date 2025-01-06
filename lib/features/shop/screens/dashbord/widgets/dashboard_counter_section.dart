import 'package:flutter/material.dart';
import 'package:store/features/shop/screens/dashbord/components/dashboard_card_component.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class DashboardCounterSection extends StatelessWidget {
  const DashboardCounterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 282),
      child: const Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: TSizes.spaceBtwItems,
            children: [
              Expanded(
                child: DashboardCardComponent(
                  image: SImages.customerIcon,
                  title: 'Total Customers',
                  subtitle: '550',
                ),
              ),
              Expanded(
                child: DashboardCardComponent(
                  image: SImages.ratingIcon,
                  title: 'Ratings',
                  subtitle: '550',
                ),
              ),
            ],
          ),
          Row(
            spacing: TSizes.spaceBtwItems,
            children: [
              Expanded(
                child: DashboardCardComponent(
                  image: SImages.productIcon,
                  title: 'Total Products',
                  subtitle: '550',
                ),
              ),
              Expanded(
                child: DashboardCardComponent(
                  image: SImages.orderIcon,
                  title: 'Total Orders',
                  subtitle: '550',
                ),
              ),
            ],
          ),
          DashboardCardComponent(
            image: SImages.saleIcon,
            title: 'Total Sales',
            subtitle: '550',
          )
        ],
      ),
    );
  }
}
