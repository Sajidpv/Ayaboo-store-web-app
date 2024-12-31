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
  });
  final String title, action;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: 1,
      radius: 8,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.lg, vertical: TSizes.lg),
      child: Column(
        spacing: TSizes.spaceBtwSections,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Text(
                      action,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeFactor: .8, color: TColors.white),
                    ),
                  )).moveUpOnHover,
            ],
          ),
          child
        ],
      ),
    );
  }
}
