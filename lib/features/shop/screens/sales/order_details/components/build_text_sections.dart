import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

Widget buildProductDescriptionDetails(
    {TextStyle? titleStyle,
    TextStyle? bodyStyle,
    required String title,
    required String value,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    int maxLines = 1}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        '$title : ',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: titleStyle ??
            Theme.of(Get.context!)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: TSizes.fontSizeSm),
      ),
      Expanded(
        child: Text(
          value,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: bodyStyle ??
              Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: TColors.darkGrey),
        ),
      ),
    ],
  );
}
