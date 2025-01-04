import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/dashbord/components/dashboard_card_component.dart';
import 'package:store/features/shop/screens/dashbord/components/dashboard_order_card_component.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class DashbordMobileScreen extends StatelessWidget {
  const DashbordMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwItems,
            children: [
              const DashboardCardComponent(
                image: SImages.customerIcon,
                title: 'Total Customers',
                subtitle: '550',
              ),
              const DashboardCardComponent(
                image: SImages.ratingIcon,
                title: 'Ratings',
                subtitle: '550',
              ),
              const DashboardCardComponent(
                image: SImages.productIcon,
                title: 'Total Products',
                subtitle: '550',
              ),
              const DashboardCardComponent(
                image: SImages.orderIcon,
                title: 'Total Orders',
                subtitle: '550',
              ),
              const DashboardCardComponent(
                image: SImages.saleIcon,
                title: 'Total Sales',
                subtitle: '550',
              ),
              SContainerWidget(
                elevation: 1,
                radius: 8,
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.lg, vertical: TSizes.lg),
                child: Column(
                  spacing: TSizes.spaceBtwItems,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Status',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(
                                  fontSizeFactor:
                                      SDeviceUtils.isMobileScreen(context)
                                          ? context.width * .002
                                          : 1),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              child: Text(
                                'All Orders',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                        fontSizeFactor: .7,
                                        color: TColors.white),
                              ),
                            )).applyHoverEffectIfWeb
                      ],
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.pendingIcon,
                      title: 'Pending',
                      subtitle: '7',
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.processingIcon,
                      title: 'Processing',
                      subtitle: '1000',
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.cancelledIcon,
                      title: 'Cancelled',
                      subtitle: '14',
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.shippedIcon,
                      title: 'Shipped',
                      subtitle: '140',
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.deliveryIcon,
                      title: 'Out for Delivery',
                      subtitle: '1700',
                    ),
                    const DashboardOrderCardComponent(
                      image: SImages.deliveredIcon,
                      title: 'Delivered',
                      subtitle: '14000',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
