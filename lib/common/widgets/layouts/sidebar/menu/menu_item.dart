import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
    this.isChild = false,
  });
  final String route;
  final IconData icon;
  final String itemName;
  final bool isChild;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.onMenuTaped(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoveredItem(route)
          : menuController.changeHoveredItem(''),
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
              color: menuController.isActive(route)
                  ? TColors.black
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusSm)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                        menuController.isActive(route) ? TSizes.md : TSizes.sm,
                    horizontal: TSizes.md),
                child: Icon(
                  icon,
                  color: TColors.primary,
                ),
              ),
              Flexible(
                  child: Text(itemName,
                      style: Theme.of(context).textTheme.bodyLarge?.apply(
                            color: menuController.isActive(route)
                                ? TColors.white
                                : TColors.darkGrey,
                          )))
            ],
          ),
        ).showCursorOnHover.moveUpOnHover,
      ),
    );
  }
}
