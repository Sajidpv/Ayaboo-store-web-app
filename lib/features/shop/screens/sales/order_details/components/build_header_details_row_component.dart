import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class BuildOrderDetailsHeaderRowComponent extends StatelessWidget {
  const BuildOrderDetailsHeaderRowComponent({
    super.key,
    this.image,
    required this.title,
    required this.child,
    this.type = ImageType.asset,
    this.icon,
  });
  final String? image;
  final IconData? icon;
  final ImageType type;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.defaultSpace,
      children: [
        SContainerWidget(
            padding: EdgeInsets.zero,
            radius: 30,
            width: 40,
            height: 40,
            backgroundColor: TColors.borderSecondary,
            child: Icon(
              icon,
              color: TColors.darkerGrey,
            )),
        // SRoundedImage(
        //   applyImageRadius: true,
        //   imageType: type,
        //   image: image,
        //   width: 40,
        //   height: 40,
        //   padding: TSizes.sm,
        //   borderRadius: TSizes.productImageRadius,
        //   backgroundColor: TColors.primaryBackground,
        // ),
        Expanded(
          child: Column(
            spacing: TSizes.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: TColors.darkGrey)),
              child
            ],
          ),
        ),
      ],
    );
  }
}
