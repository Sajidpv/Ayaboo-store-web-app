import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';

import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

import 'package:store/utils/helpers/helper_functions.dart';

class ConversationSourceRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: index == 0 ? Colors.grey.shade300 : Colors.transparent,
                width: index == 0 ? 1.0 : 0),
            left: BorderSide(color: Colors.grey.shade300, width: 1.0),
            right: BorderSide(color: Colors.grey.shade300, width: 1.0),
            bottom: BorderSide(
                color: index == 9 ? Colors.grey.shade300 : Colors.transparent,
                width: index == 10 ? 1.0 : 0),
          ),
        ),
        cells: [
          DataCell(Text(
            SHelperFunctions.getFormattedDate(DateTime.now()),
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            '45364-3426',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'PYMNT-4387568437',
            overflow: TextOverflow.ellipsis,
          )),
          const DataCell(Text(
            'Rs.250',
            overflow: TextOverflow.ellipsis,
          )),
          DataCell(SContainerWidget(
            padding: const EdgeInsets.all(TSizes.sm),
            radius: TSizes.cardRadiusSm,
            backgroundColor:
                SHelperFunctions.getPaymentStatusColor(PaymentStatus.paid)
                    .withValues(alpha: .2),
            child: const Text(
              'Credit Card',
              overflow: TextOverflow.ellipsis,
            ),
          )),
          DataCell(SContainerWidget(
            padding: const EdgeInsets.all(TSizes.sm),
            radius: TSizes.cardRadiusSm,
            backgroundColor:
                SHelperFunctions.getPaymentStatusColor(PaymentStatus.pending)
                    .withValues(alpha: .2),
            child: const Text(
              'Pending',
              overflow: TextOverflow.ellipsis,
            ),
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
