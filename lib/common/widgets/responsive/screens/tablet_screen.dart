import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/header/header.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar.dart';

class TabletScreen extends StatelessWidget {
  TabletScreen({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const SSidebar(),
        appBar: SHeader(
          scaffoldKey: scaffoldKey,
        ),
        body: body ?? const SizedBox());
  }
}
