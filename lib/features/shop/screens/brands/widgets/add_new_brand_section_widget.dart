import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';

class AddNewBrandSectionWidget extends StatelessWidget {
  const AddNewBrandSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: .5,
      borderColor: TColors.accent,
      child: Column(
        children: [
          SPageHeading(
            heading: 'Add new brands',
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
