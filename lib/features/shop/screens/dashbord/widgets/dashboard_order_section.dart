import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/layouts/templates/section_title_template.dart';
import 'package:store/features/shop/screens/dashbord/components/dashboard_order_card_component.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class DashboardOrderSection extends StatelessWidget {
  const DashboardOrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SContainerWidget(
          elevation: 1,
          radius: 8,
          padding:
              EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.lg),
          child: SSectionHeaderTemplate(
            title: 'Order Status',
            action: 'All Orders',
            child: Column(
              spacing: TSizes.spaceBtwSections,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: TSizes.spaceBtwItems,
                  children: [
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.pendingIcon,
                        title: 'Pending',
                        subtitle: '7',
                      ),
                    ),
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.processingIcon,
                        title: 'Processing',
                        subtitle: '1000',
                      ),
                    ),
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.cancelledIcon,
                        title: 'Cancelled',
                        subtitle: '14',
                      ),
                    )
                  ],
                ),
                Row(
                  spacing: TSizes.spaceBtwItems,
                  children: [
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.shippedIcon,
                        title: 'Shipped',
                        subtitle: '140',
                      ),
                    ),
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.deliveryIcon,
                        title: 'Out for Delivery',
                        subtitle: '1700',
                      ),
                    ),
                    Expanded(
                      child: DashboardOrderCardComponent(
                        image: SImages.deliveredIcon,
                        title: 'Delivered',
                        subtitle: '14000',
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
