import 'package:get/get.dart';

class ReportController extends GetxController {
  static ReportController get instance => Get.find();
  final RxList<bool> expandedRows = RxList.generate(20, (_) => false);

  void expandTableRow(index) {
    print('hitting');
    expandedRows[index] = !expandedRows[index];
  }
}
