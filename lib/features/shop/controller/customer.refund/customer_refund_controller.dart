import 'package:get/get.dart';
import 'package:store/utils/constants/enums.dart';

class CustomerRefundController extends GetxController {
  static CustomerRefundController get instance => Get.find();

  Rx<RefundTypes> selectedRefundType = RefundTypes.all.obs;

  void changeRefundType(value) {
    selectedRefundType.value = value;
  }
}
