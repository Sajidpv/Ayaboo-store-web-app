import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/buttons/material_button.dart';
import 'package:store/features/shop/screens/stock/stock_transfer/tables/stock_transfer_table.dart';
import 'package:store/features/shop/screens/stock/stock_transfer/widgets/create_stock_transfer.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/popups/dialogues.dart';

class StockTransferDesktopTabletMobileScreen extends StatelessWidget {
  const StockTransferDesktopTabletMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SBreadcrumbsWithHeading(
                    breadcrumbItems: ['Stock-transfer'],
                    heading: 'Stock Transfer',
                  ),
                  if (!SDeviceUtils.isMobileScreen(context))
                    MaterialButtonWidget(
                      icon: Icons.add,
                      padding:
                          const EdgeInsets.symmetric(horizontal: TSizes.lg * 2),
                      shape: const StadiumBorder(),
                      title: 'Creat Stock Transfer',
                      color: TColors.primary,
                      textColor: TColors.white,
                      onPressed: () => SDialogues.defaultDialog(
                        context: context,
                        content: buildCreateStockTransferAlerDialogContent(),
                        actions: buildCreateStockTransferAlertdialogActions(),
                      ),
                    )
                ],
              ),
              if (SDeviceUtils.isMobileScreen(context))
                MaterialButtonWidget(
                  icon: Icons.add,
                  padding:
                      const EdgeInsets.symmetric(horizontal: TSizes.lg * 2),
                  shape: const StadiumBorder(),
                  title: 'Creat Stock Transfer',
                  color: TColors.primary,
                  textColor: TColors.white,
                  onPressed: () {},
                ),
              const StockTransferTable(),
            ],
          ),
        ),
      ),
    );
  }
}
