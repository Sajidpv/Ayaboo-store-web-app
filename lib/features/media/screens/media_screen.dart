import 'package:flutter/widgets.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/media/screens/responsive_screens/media_desktop_screen.dart';
import 'package:store/features/media/screens/responsive_screens/media_mobile_screen.dart';
import 'package:store/features/media/screens/responsive_screens/media_tablet_screen.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: MediaDesktopScreen(),
      mobile: MediaMobileScreen(),
      tablet: MediaTabletScreen(),
    );
  }
}
