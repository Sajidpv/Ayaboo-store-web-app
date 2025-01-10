import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class SChoiceChips extends StatelessWidget {
  const SChoiceChips(
      {super.key,
      required this.text,
      required this.isSelected,
      this.onSelected});
  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: SHelperFunctions.getColor(text) == null
            ? Text(text)
            : const SizedBox(),
        avatar: SHelperFunctions.getColor(text) == null
            ? SContainerWidget(
                width: 50,
                height: 50,
                backgroundColor: SHelperFunctions.getColor(text)!)
            : null,
        selected: isSelected,
        onSelected: onSelected,
        backgroundColor: SHelperFunctions.getColor(text),
        labelStyle: TextStyle(color: isSelected ? TColors.white : null),
        shape: SHelperFunctions.getColor(text) != null
            ? const CircleBorder()
            : null,
        padding:
            SHelperFunctions.getColor(text) == null ? null : EdgeInsets.zero,
        labelPadding:
            SHelperFunctions.getColor(text) == null ? null : EdgeInsets.zero,
      ),
    );
  }
}
