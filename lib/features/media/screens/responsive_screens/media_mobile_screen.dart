import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/media/screens/components/media_img_upload_toggle_component.dart';
import 'package:store/features/media/screens/widgets/media_content_section.dart';
import 'package:store/features/media/screens/widgets/media_uploader.dart';
import 'package:store/utils/constants/sizes.dart';

class MediaMobileScreen extends StatelessWidget {
  const MediaMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.spaceBtwSections,
            children: [
              const SBreadcrumbsWithHeading(
                heading: 'Media',
                breadcrumbItems: ['Media Screen'],
              ),
              const BuildUploadImgButtonToggle(),
              const MediaUploader(),
              MediaContentSection(),
            ],
          ),
        ),
      ),
    );
  }
}
