import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/header/header.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  body ?? const SizedBox()
                ],
              ))
        ],
      ),
    );
  }
}
