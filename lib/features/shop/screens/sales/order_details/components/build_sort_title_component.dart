import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/sizes.dart';

Text buildSortTitle({required String text, TextStyle? style}) {
  return Text(
    text,
    style: style ??
        Theme.of(Get.context!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.w600),
  );
}
