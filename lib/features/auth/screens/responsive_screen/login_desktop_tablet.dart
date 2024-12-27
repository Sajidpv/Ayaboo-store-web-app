import 'package:flutter/material.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: SSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
            child: Column(
              children: [
                ///HEADER
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                          SImages.lightAppLogo,
                        ),
                        width: 100,
                        height: 100,
                      ),
                      TSizes.spaceBtwSections.height,
                      Text(STexts.loginTitle),
                      TSizes.sm.height
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
