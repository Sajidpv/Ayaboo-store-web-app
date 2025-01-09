import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:store/common/widgets/icons/circular_icon_button_widget.dart';
import 'package:store/common/widgets/images/s_circular_image.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class SImageUploaderWidget extends StatelessWidget {
  const SImageUploaderWidget(
      {super.key,
      this.isCircular = false,
      this.image,
      required this.imageType,
      this.width = 100,
      this.height = 100,
      this.top,
      this.bottom = 0,
      this.right,
      this.left = 0,
      this.memmoryImage,
      this.icon = Icons.edit,
      this.onIconButtonPressed});

  final bool isCircular;
  final String? image;
  final ImageType imageType;
  final double width, height;
  final double? top, bottom, right, left;
  final Uint8List? memmoryImage;
  final IconData icon;
  final void Function()? onIconButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isCircular
            ? SCircularImage(
                image: image,
                width: width,
                height: height,
                memoryImage: memmoryImage,
                imageType: imageType,
                backgroundColor: TColors.primaryBackground,
              )
            : SRoundedImage(
                image: image,
                width: width,
                height: height,
                memoryImage: memmoryImage,
                imageType: imageType,
                backgroundColor: TColors.primaryBackground,
              ),
        Positioned(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
            child: SCircularIconButtonWidget(
              icon: icon,
              color: TColors.white,
              backgroudColor: TColors.primary.withValues(alpha: .9),
              size: TSizes.md,
              onIconPressed: onIconButtonPressed,
            ))
      ],
    );
  }
}
