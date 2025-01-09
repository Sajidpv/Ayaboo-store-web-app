import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/controller/sidebar_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.route,
    this.image,
    required this.itemName,
    this.children,
    this.icon = Icons.adjust_rounded,
    this.parent,
  });
  final String? route, parent;
  final String? image;
  final IconData? icon;
  final String itemName;

  final List<MenuItem>? children;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    final isExpandable = children != null && children!.isNotEmpty;
    return InkWell(
      onTap: () => menuController.onMenuTaped(route ?? ''),
      onHover: (hovering) => hovering
          ? menuController.changeHoveredItem(route ?? '')
          : menuController.changeHoveredItem(''),
      child: isExpandable
          ? _buildExpansionTile(menuController, context)
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
              child:
                  _buildMenu(menuController: menuController, context: context),
            ),
    );
  }

// Widget for expandable menu item
  Widget _buildExpansionTile(
      SidebarController menuController, BuildContext context) {
    return Obx(
      () => Theme(
        data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            expansionTileTheme:
                const ExpansionTileThemeData(iconColor: TColors.primary)),
        child: ExpansionTile(
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          tilePadding: const EdgeInsets.only(right: TSizes.md),
          key: PageStorageKey<String>(route ?? ''), // Ensure state persistence
          initiallyExpanded: menuController.isActive(route ?? ''),
          title: _buildMenuTitle(
              menuController, context, menuController.isExActive(parent ?? '')),
          children: children!
              .map((child) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: menuController.isActive(route ?? "")
                            ? TSizes.md
                            : TSizes.sm,
                        horizontal: TSizes.lg),
                    child: child,
                  ))
              .toList(),
        ).showCursorOnHoverIfWeb.applyHoverEffectIfWeb,
      ),
    );
  }

  Widget _buildMenu(
      {required SidebarController menuController,
      required BuildContext context}) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: menuController.isActive(route ?? '')
                ? TColors.black
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm)),
        child: _buildMenuTitle(
            menuController, context, menuController.isActive(route ?? '')),
      ).showCursorOnHoverIfWeb.applyHoverEffectIfWeb,
    );
  }

  Row _buildMenuTitle(
      SidebarController menuController, BuildContext context, bool isActive) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: menuController.isActive(route ?? '')
                    ? TSizes.md
                    : TSizes.xs,
                horizontal: TSizes.md),
            child: image != null
                ? Image.asset(
                    image!,
                    width: 15,
                  )
                : Icon(
                    icon,
                    color: isActive
                        ? TColors.primary
                        : TColors.grey.withValues(alpha: .6),
                    size: 15,
                  )),
        Flexible(
            child: Text(itemName,
                style: Theme.of(context).textTheme.bodyLarge?.apply(
                      color: isActive ? TColors.white : TColors.darkGrey,
                    )))
      ],
    );
  }
}
