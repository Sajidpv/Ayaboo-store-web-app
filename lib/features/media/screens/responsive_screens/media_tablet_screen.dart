import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/media/screens/components/media_img_upload_toggle_component.dart';
import 'package:store/features/media/screens/widgets/media_content_section.dart';
import 'package:store/features/media/screens/widgets/media_uploader.dart';
import 'package:store/utils/constants/sizes.dart';

class MediaTabletScreen extends StatelessWidget {
  const MediaTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.spaceBtwSections,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SBreadcrumbsWithHeading(
                    heading: 'Media',
                    breadcrumbItems: ['Media Screen'],
                  ),
                  BuildUploadImgButtonToggle(),
                ],
              ),
              MediaUploader(),
              MediaContentSection(),
            ],
          ),
        ),
      ),
    );
  }
}
