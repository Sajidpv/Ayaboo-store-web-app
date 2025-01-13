import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        color: TColors.primaryBackground,
      ),
      child: ListTile(
        leading: Image.asset(
          SImages.orderIcon,
          width: 50,
          height: 30,
          color: TColors.primary,
        ),
        title: Text(
          'Order Confirmed',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: const Text(
            'Order ID payment for product name costs price confirmed'),
        trailing: kIsWeb
            ? TextButton(onPressed: () {}, child: const Text('Mark as Read'))
            : IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mark_chat_read_rounded,
                  color: TColors.primary.withValues(alpha: .8),
                )),
      ),
    );
  }
}
