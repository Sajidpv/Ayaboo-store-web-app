import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/header/header.dart';
import 'package:store/common/widgets/layouts/sidebar/notification_sidebar.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar.dart';
import 'package:store/utils/extensions/device_size_extensions.dart';

class TabletScreen extends StatelessWidget {
  TabletScreen({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: SNotificationSidebar(
          width: context.mediaQueryWidth * .5,
        ),
        drawer: const SSidebar(),
        appBar: SHeader(
          scaffoldKey: scaffoldKey,
        ),
        body: body ?? const SizedBox());
  }
}
