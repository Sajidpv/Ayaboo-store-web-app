import 'package:flutter/material.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class SLoginTemplate extends StatelessWidget {
  const SLoginTemplate({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Container(
              padding: SSpacingStyle.defaultPadding,
              decoration: BoxDecoration(
                  gradient: TColors.myGradient(),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
              child: child),
        ),
      ),
    );
  }
}
