import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class InputFieldSectionWidget extends StatelessWidget {
  const InputFieldSectionWidget({
    super.key,
    this.title,
    required this.child,
  });
  final String? title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title ?? '',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: TSizes.fontSizeMd,
                  color: TColors.textSecondary.withValues(alpha: .8))),
        child,
      ],
    );
  }
}
