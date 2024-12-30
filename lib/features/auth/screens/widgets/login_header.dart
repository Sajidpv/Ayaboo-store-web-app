import 'package:flutter/material.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/extensions/hover_extension.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage(
            SImages.darkAppLogo,
          ),
          width: 120,
          height: 100,
        ).showCursorOnHover,
        Text(STexts.loginTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.apply(fontWeightDelta: 1)),
      ],
    );
  }
}
