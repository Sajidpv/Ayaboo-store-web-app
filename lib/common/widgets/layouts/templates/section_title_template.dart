import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class SSectionHeaderTemplate extends StatelessWidget {
  const SSectionHeaderTemplate({
    super.key,
    required this.title,
    required this.action,
    required this.child,
    this.elevation = .5,
    this.color,
  });
  final String action;
  final Widget child, title;
  final double elevation;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: elevation,
      radius: 8,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.lg, vertical: TSizes.lg),
      child: Column(
        spacing: TSizes.spaceBtwSections,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              title,
              const Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Text(
                      action,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontSizeFactor: .8,
                            color: TColors.white,
                          ),
                    ),
                  )).applyHoverEffectIfWeb,
            ],
          ),
          child
        ],
      ),
    );
  }
}
