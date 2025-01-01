import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/header/header.dart';
import 'package:store/common/widgets/layouts/sidebar/notification_sidebar.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar.dart';
import 'package:store/utils/extensions/device_size_extensions.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SNotificationSidebar(
        width: context.mediaQueryWidth * .3,
      ),
      body: Row(
        children: [
          const Expanded(child: SSidebar()),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  ///Header/Nav
                  const SHeader(),
                  //////body
                  Expanded(child: body ?? const SizedBox())
                ],
              ))
        ],
      ),
    );
  }
}
