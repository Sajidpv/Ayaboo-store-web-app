import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3, fillColor: TColors.white, filled: true,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: TSizes.fontSizeMd,
        color: TColors.textSecondary.withValues(alpha: .8)),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TColors.black.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide:
          BorderSide(width: 1, color: TColors.darkGrey.withValues(alpha: .4)),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide:
          BorderSide(width: 1, color: TColors.darkGrey.withValues(alpha: .4)),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide:
          BorderSide(width: 1, color: TColors.primary.withValues(alpha: 0.4)),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeMd, color: TColors.darkGrey),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: TColors.darkGrey.withValues(alpha: 0.4)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide:
          BorderSide(width: 1, color: TColors.primary.withValues(alpha: 0.5)),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );
}
