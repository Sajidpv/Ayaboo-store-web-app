import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              'Column1': 'Data ${index + 1}-1',
              'Column2': 'Data ${index + 1}-2',
              'Column3': 'Data ${index + 1}-3',
              'Column4': 'Data ${index + 1}-4'
            }));
    filteredDataList.addAll(List.generate(
        33,
        (index) => {
              'Column1': 'Data ${index + 1}-1',
              'Column2': 'Data ${index + 1}-2',
              'Column3': 'Data ${index + 1}-3',
              'Column4': 'Data ${index + 1}-4'
            }));
  }
}
