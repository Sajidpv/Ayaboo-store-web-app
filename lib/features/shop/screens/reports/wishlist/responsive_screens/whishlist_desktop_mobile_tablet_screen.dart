import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/shop/screens/reports/wishlist/tables/reports_table.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class WhishlistDesktopMobileTabletScreen extends StatelessWidget {
  const WhishlistDesktopMobileTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'name': 'John Doe',
        'age': 29,
        'details': 'Additional details about John Doe.',
      },
      {
        'name': 'Jane Smith',
        'age': 34,
        'details': 'Additional details about Jane Smith.',
      },
      {
        'name': 'Mike Johnson',
        'age': 25,
        'details': 'Additional details about Mike Johnson.',
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              const SBreadcrumbsWithHeading(
                breadcrumbItems: ['Reports/Whishlist'],
                heading: 'Wishlist',
              ),
              SContainerWidget(
                height: 760,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBox(
                      hint: 'Search by keyword',
                    ),
                    ListTile(
                      minLeadingWidth: 50,
                      leading: Text(
                        '#',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      title: Text(
                        'Product Name',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      trailing: Text(
                        'Number of Wishes'.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => SContainerWidget(
                                padding: const EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                  child: ExpansionTile(
                                    leading: Text((index + 1).toString()),
                                    title: Row(
                                      children: [
                                        const SRoundedImage(
                                          width: 50,
                                          height: 50,
                                          imageType: ImageType.asset,
                                          image: SImages.darkAppLogo,
                                        ),
                                        Expanded(
                                          child: Text(data[index]['name']),
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      spacing: TSizes.defaultSpace,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(data[index]['age'].toString()),
                                        const Icon(
                                            Icons.keyboard_arrow_down_rounded)
                                      ],
                                    ),
                                    children: [
                                      Text(data[index]['details']),
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
