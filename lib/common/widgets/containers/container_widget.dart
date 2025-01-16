import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class SContainerWidget extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final double? width, height, elevation;
  final bool showBorder, showShadow;
  final Color borderColor, backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final void Function()? onTap;

  const SContainerWidget({
    super.key,
    this.child,
    this.radius = TSizes.cardRadiusLg,
    this.width,
    this.height,
    this.showBorder = false,
    this.showShadow = true,
    this.borderColor = TColors.borderPrimary,
    this.backgroundColor = TColors.white,
    this.margin,
    this.padding = const EdgeInsets.all(TSizes.md),
    this.onTap,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(radius!),
        elevation: elevation ?? 0,
        child: Container(
          margin: margin,
          padding: padding,
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: showBorder
                  ? Border.all(color: borderColor.withValues(alpha: .5))
                  : null,
              borderRadius: BorderRadius.circular(radius!),
              color: backgroundColor,
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                      color: TColors.grey.withValues(alpha: .1),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: const Offset(0, 3))
              ]),
          child: child,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class SContainerWidget extends StatelessWidget {
//   final Widget? child;
//   final bool isCentered;
//   final bool isBorder;
//   final double? leftPadding;
//   final Color borderColor;
//   final double padding;
//   final double margin;
//   final double? width;
//   final double? height;
//   final BorderRadiusGeometry? borderRadius;
//   final Color backgroundColor;
//   final Gradient? gradient;
//   final double elevation;
//   final double radius;

//   const SContainerWidget({
//     super.key,
//     this.child,
//     this.isCentered = false,
//     this.isBorder = false,
//     this.leftPadding,
//     this.borderColor = Colors.grey,
//     this.padding = 0.0,
//     this.margin = 0.0,
//     this.width,
//     this.height,
//     this.borderRadius,
//     this.backgroundColor = Colors.transparent,
//     this.gradient,
//     this.elevation = 5.0,
//     this.radius = 8.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevation,
//       borderRadius: BorderRadius.circular(radius),
//       child: Container(
//         margin: EdgeInsets.all(margin),
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           border: isBorder ? Border.all(color: borderColor) : null,
//           borderRadius:
//               borderRadius ?? BorderRadius.all(Radius.circular(radius)),
//           color: gradient != null ? null : backgroundColor,
//           gradient: gradient,
//         ),
//         child: Padding(
//           padding: leftPadding != null
//               ? EdgeInsets.only(left: leftPadding!)
//               : EdgeInsets.all(padding),
//           child: isCentered
//               ? Center(
//                   child: child,
//                 )
//               : child,
//         ),
//       ),
//     );
//   }
// }
