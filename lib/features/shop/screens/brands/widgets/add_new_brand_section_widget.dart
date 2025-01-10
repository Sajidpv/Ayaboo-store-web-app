import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/inputs/browse_images.dart';
import 'package:store/common/widgets/inputs/input_sections.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class AddNewBrandSectionWidget extends StatelessWidget {
  const AddNewBrandSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: .5,
      borderColor: TColors.accent,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: TSizes.spaceBtwInputFields,
          children: [
            SPageHeading(
              heading: 'Brand Request',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            InputFieldSectionWidget(
              title: 'Brand Name',
              child: TextFormField(
                decoration: const InputDecoration(hintText: 'Brand Name'),
              ),
            ),
            const InputFieldSectionWidget(
                title: 'Brand Logo(120x80)', child: SBrowsImages()),
            InputFieldSectionWidget(
              title: 'Trade mark number',
              child: TextFormField(
                decoration: const InputDecoration(hintText: 'Brand Name'),
              ),
            ),
            const InputFieldSectionWidget(
                title: 'Trade mark certificate', child: SBrowsImages()),
            InputFieldSectionWidget(
              title: 'Brand certificate owner name',
              child: TextFormField(
                decoration: const InputDecoration(hintText: 'Brand Name'),
              ),
            ),
            const InputFieldSectionWidget(
                title: 'Brand owned by another people, Please upload noc',
                child: SBrowsImages()),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text('Featured'),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  width: TSizes.buttonWidth * 1.4,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Request'))),
            )
          ],
        ),
      ),
    );
  }
}
