import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/data_table/controller/table_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/loaders/animation_loader.dart';

class SPaginatedDataTable extends StatelessWidget {
  const SPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.minWidth = 1000,
    this.dataRowHeight = TSizes.xl * 2,
    this.sortColumnIndex,
    this.rowsPerPage = 10,
    required this.source,
    required this.columns,
    this.onPageChanged,
    this.tableHeight = 760,
    this.headerColor = TColors.white,
  });

  final bool sortAscending;
  final double minWidth, dataRowHeight;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double tableHeight;
  final Color? headerColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaginatedTableController());

    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
            cardTheme: const CardTheme(
          color: TColors.white,
          elevation: 0,
        )),
        child: Obx(() {
          return PaginatedDataTable2(
            columns: columns,
            source: source,
            columnSpacing: 12,
            minWidth: minWidth,
            dividerThickness: 0,
            horizontalMargin: 12,
            dataRowHeight: dataRowHeight,
            ///////pagination
            rowsPerPage: controller.rowsPerPage.value,
            onRowsPerPageChanged: controller.onRowsPerPageChanged,
            availableRowsPerPage: const [5, 10, 20, 50, 100],
            showFirstLastButtons: true,
            showCheckboxColumn: true,
            onPageChanged: onPageChanged, //action while change a page
            renderEmptyRowsInTheEnd:
                false, ////remove emty checkbox at last page
            // onRowsPerPageChanged: (noOfRows) {}, for fetchingdata as pagination

            /////////SORTING///////////
            sortAscending: sortAscending,
            sortArrowAlwaysVisible: true,
            sortColumnIndex: sortColumnIndex,
            sortArrowIcon: Icons.arrow_upward,
            sortArrowBuilder: (ascending, sorted) {
              if (sorted) {
                return Icon(
                  ascending ? Icons.arrow_upward : Icons.arrow_downward,
                  size: TSizes.iconSm,
                );
              } else {
                return const Icon(
                  Icons.swap_vert_outlined,
                  size: TSizes.iconSm,
                );
              }
            },
            headingTextStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
            headingRowColor: WidgetStateProperty.resolveWith(
                (states) => headerColor!.withValues(alpha: .3)),
            headingRowDecoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              ),
            ),
            empty: const SAnimationLoaderWidget(
              text: 'Nothing found',
              animation: '',
              width: 200,
              height: 200,
            ),
          );
        }),
      ),
    );
  }
}
