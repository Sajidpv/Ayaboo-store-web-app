import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/shop/controller/reports/report_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({super.key, required this.trailing});
  final String trailing;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());
    final data = controller.data;
    return SContainerWidget(
      height: 760,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(
            hint: 'Search by keyword',
          ),
          TSizes.sm.height,
          ListTile(
            minLeadingWidth: 50,
            leading: Text(
              '#',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            title: Text(
              'Product Name',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing: Text(
              maxLines: 2,
              trailing,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => SContainerWidget(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            index == 0 ? TSizes.cardRadiusXs : 0),
                        topRight: Radius.circular(
                            index == 0 ? TSizes.cardRadiusXs : 0),
                        bottomLeft: Radius.circular(
                            index == data.length - 1 ? TSizes.cardRadiusXs : 0),
                        bottomRight: Radius.circular(
                            index == data.length - 1 ? TSizes.cardRadiusXs : 0),
                      ),
                      padding: EdgeInsets.zero,
                      showBorder: true,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          leading: Text((index + 1).toString()),
                          title: Row(
                            spacing: TSizes.spaceBtwItems,
                            children: [
                              SRoundedImage(
                                borderRadius: TSizes.cardRadiusXs,
                                border: Border.all(color: TColors.grey),
                                width: 60,
                                height: 60,
                                imageType: ImageType.asset,
                                image: SImages.darkAppLogo,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]['name']),
                                    Text(
                                      'Size: ${data[index]['sizeno']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: TColors.textSecondary),
                                    ),
                                    Text('Color: ${data[index]['colorno']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: TColors.textSecondary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            spacing: TSizes.defaultSpace,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(data[index]['age'].toString()),
                              const Icon(Icons.keyboard_arrow_down_rounded)
                            ],
                          ),
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data[index]['child'].length,
                                itemBuilder: (context, indexc) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      TSizes.xl * 2,
                                      TSizes.sm,
                                      TSizes.sm,
                                      TSizes.sm,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            spacing: TSizes.spaceBtwItems,
                                            children: [
                                              SRoundedImage(
                                                borderRadius:
                                                    TSizes.cardRadiusXs,
                                                border: Border.all(
                                                    color: TColors.grey),
                                                width: 40,
                                                height: 40,
                                                imageType: ImageType.asset,
                                                image: SImages.darkAppLogo,
                                              ),
                                              Text(data[index]['child'][indexc]
                                                      ['color']
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Wrap(
                                            spacing: TSizes.xs,
                                            runSpacing: TSizes.xs,
                                            children: data[index]['child']
                                                    [indexc]['sizes']
                                                .map<Widget>((size) => Text(
                                                      '${size['size'].toString()}-${size['quantity'].toString()}',
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
