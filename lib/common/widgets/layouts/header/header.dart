import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/common/widgets/inputs/search_box.dart';
import 'package:store/common/widgets/shimmers/shimmer.dart';
import 'package:store/features/auth/controllers/login_controller.dart';
import 'package:store/features/auth/controllers/user_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/hover_extension.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

//Top navigation header of the app
class SHeader extends StatelessWidget implements PreferredSizeWidget {
  const SHeader({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Container(
      decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(bottom: BorderSide(color: TColors.grey, width: 1))),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /////Mobile menu
        leading: !SDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
              )
            : null,
        automaticallyImplyLeading: false,
        ///////Search bar
        title: SDeviceUtils.isDesktopScreen(context) ? const SearchBox() : null,

        /////Actions
        actions: [
          if (!SDeviceUtils.isDesktopScreen(context))
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ).applyHoverEffectIfWeb,
          if (SDeviceUtils.isDesktopScreen(context))
            IconButton(
              icon: const Icon(
                Icons.fullscreen,
                color: TColors.darkGrey,
              ),
              onPressed: () {},
            ).applyHoverEffectIfWeb,
          IconButton(
            icon: const Badge(
              child: Icon(
                Icons.notifications,
                color: TColors.darkGrey,
              ),
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ).applyHoverEffectIfWeb,
          (TSizes.spaceBtwItems / 2).width,
          if (!SDeviceUtils.isMobileScreen(context))
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.loading.value
                      ? const SShimmerEffect(width: 50, heigh: 13)
                      : Text(
                          controller.user.value.name ?? 'No user',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                  controller.loading.value
                      ? const SShimmerEffect(width: 50, heigh: 13)
                      : Text(
                          controller.user.value.email ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                ],
              ),
            ),
          TSizes.md.width,
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(TSizes.inputFieldMinimumRadius),
                  ),
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        LoginController.instance.logOut();
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Obx(
              () => controller.loading.value
                  ? const SShimmerEffect(
                      width: 40,
                      heigh: 40,
                      radius: TSizes.md,
                    )
                  : SRoundedImage(
                      width: 40,
                      height: 40,
                      padding: 2,
                      imageType: ImageType.asset,
                      image: controller.user.value.image ?? '',
                    ).showCursorOnHoverIfWeb,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(SDeviceUtils.getAppBarHeight() + 15);
}
