import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class SShimmerEffect extends StatelessWidget {
  const SShimmerEffect(
      {super.key,
      required this.width,
      required this.heigh,
      this.radius = 15,
      this.color});
  final double width, heigh, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = SHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: heigh,
        decoration: BoxDecoration(
            color: color ?? (isDark ? TColors.darkGrey : TColors.white),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
