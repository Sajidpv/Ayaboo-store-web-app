import 'package:get/get.dart';

class PaginatedTableController extends GetxController {
  static PaginatedTableController get instance => Get.find();
  RxInt rowsPerPage = 10.obs;

  void onRowsPerPageChanged(value) {
    rowsPerPage.value = value!;
  }
}
