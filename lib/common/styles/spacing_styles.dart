import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class SSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.appBarHeight,
      bottom: TSizes.defaultSpace,
      left: TSizes.defaultSpace,
      right: TSizes.defaultSpace);
  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.only(
      top: TSizes.sm, bottom: TSizes.sm, left: TSizes.md, right: TSizes.md);
}
