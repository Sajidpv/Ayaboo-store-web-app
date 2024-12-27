import 'package:flutter/material.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
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

        ///////Search bar
        title: SDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search anything...'),
                ),
              )
            : null,

        /////Actions
        actions: [
          if (!SDeviceUtils.isDesktopScreen(context))
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ).moveUpOnHover,
          if (SDeviceUtils.isDesktopScreen(context))
            IconButton(
              icon: const Icon(
                Icons.fullscreen,
                color: TColors.darkGrey,
              ),
              onPressed: () {},
            ).moveUpOnHover,
          IconButton(
            icon: const Badge(
              child: Icon(
                Icons.notifications,
                color: TColors.darkGrey,
              ),
            ),
            onPressed: () {},
          ).moveUpOnHover,
          (TSizes.spaceBtwItems / 2).width,
          if (!SDeviceUtils.isMobileScreen(context))
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sajid PV',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'sajidpv@gmail.com',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          TSizes.md.width,
          const SRoundedImage(
            width: 40,
            height: 40,
            padding: 2,
            imageType: ImageType.asset,
            image: SImages.user,
          ).showCursorOnHover,
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(SDeviceUtils.getAppBarHeight() + 15);
}
