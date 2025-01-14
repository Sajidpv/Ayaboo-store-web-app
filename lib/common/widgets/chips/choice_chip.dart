import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

Widget buildTextChoiceChip({
  required String label,
  required bool selected,
  required Function(bool) onSelected,
}) {
  final String title = label == 'all' ? 'Refund / Replace' : label.capitalize!;
  return ChoiceChip(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.defaultSpace),
    ),
    side: const BorderSide(color: Colors.transparent),
    showCheckmark: false,
    selectedColor: TColors.black,
    backgroundColor: TColors.white,
    label: Text(
      '$title Requests',
      style: Theme.of(Get.context!).textTheme.headlineMedium!.copyWith(
          color: selected ? TColors.white : TColors.black,
          fontSize: TSizes.fontSizeMd),
    ),
    selected: selected,
    onSelected: onSelected,
  );
}
// Widget buildChoiceChip({
//   required String label,
//   required bool selected,
//   required bool isEnabled,
//   required Function(bool) onSelected,
// }) {
//   return ChoiceChip(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(0),
//     ),
//     side: BorderSide(
//         color:
//             isEnabled ? TColors.black : TColors.darkGrey.withValues(alpha: .1)),
//     showCheckmark: false,
//     selectedColor:
//         isEnabled ? TColors.black : TColors.darkGrey.withValues(alpha: .3),
//     backgroundColor: TColors.white,
//     label: Text(
//       label,
//       style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
//           color: isEnabled
//               ? selected
//                   ? TColors.white
//                   : TColors.black
//               : TColors.darkGrey,
//           fontSize: 12),
//     ),
//     selected: selected,
//     onSelected: onSelected,
//   );
// }

// Widget buildImageChoiceChip({
//   required String url,
//   required bool selected,
//   required Color color,
//   required Function(bool) onSelected,
// }) {
//   return ChoiceChip(
//     shape: const RoundedRectangleBorder(
//       side: BorderSide(color: Colors.transparent),
//     ),
//     showCheckmark: false,
//     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//     padding: EdgeInsets.zero,
//     labelPadding: EdgeInsets.zero,
//     selectedColor: color,
//     disabledColor: Colors.transparent,
//     label: Stack(
//       children: [
//         Container(
//             margin: const EdgeInsets.all(2),
//             width: 50,
//             height: 50,
//             child: Image.network(
//               url,
//               fit: BoxFit.cover,
//             )),
//         Container(
//           margin: const EdgeInsets.all(2),
//           width: 50,
//           height: 50,
//           color: color.withValues(alpha: .3),
//         ),
//       ],
//     ),
//     selected: selected,
//     onSelected: onSelected,
//   );
// }
