import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/enums.dart';

class SalesController extends GetxController {
  var dataList = <Map<String, dynamic>>[].obs;
  var filteredDataList = <Map<String, dynamic>>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAsce = true.obs;
  final searchController = TextEditingController();
  @override
  void onInit() {
    fetchDummyData();
    super.onInit();
  }

  void sortByIndex(int sortColumnIndex, bool asce) {
    sortAsce.value = asce;
    filteredDataList.sort((a, b) {
      if (asce) {
        return filteredDataList[0]['column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['column1'].toString().toLowerCase());
      } else {
        return filteredDataList[0]['column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['column1'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  void search(String query) {
    if (query.isEmpty || query == '') {
      filteredDataList.assignAll(dataList);
    } else {
      filteredDataList.assignAll(dataList
          .where((item) => item['column1'].contains(query.toLowerCase())));
    }
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(33, (index) => false));
    dataList.addAll(List.generate(
        33,
        (index) => {
              'Column1': '20240506-21040475',
              'Column2': '0$index ',
              'Column3.1': 'Seller${index + 1}',
              'Column3': 'User${index + 1}',
              'Column4': 'Rs1003${index + 1 * index * index}',
              'Column5': DeliveryStatus.values[index > 4 ? 0 : index]
                  .toString()
                  .split('.')[1],
              'Column6': PaymentMethods.values[index > 8 ? 0 : index]
                  .toString()
                  .split('.')[1],
              'Column7': PaymentStatus.values[index > 3 ? 0 : index]
                  .toString()
                  .split('.')[1],
              'Column8': 'No refund',
            }));
    filteredDataList.addAll(List.generate(
        33,
        (index) => {
              'Column1': '20240506-21040475',
              'Column2': '0$index ',
              'Column3.1': 'Seller${index + 1}',
              'Column3': 'User${index + 1}',
              'Column4': 'Rs1003${index + 1 * index * index}',
              'Column5': DeliveryStatus.values[index > 4 ? 0 : index],
              'Column6': PaymentMethods.values[index > 8 ? 0 : index]
                  .toString()
                  .split('.')[1],
              'Column7': PaymentStatus.values[index > 2 ? 0 : index + 1],
              'Column8': 'No refund',
            }));
  }
}
