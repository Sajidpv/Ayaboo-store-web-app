import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/order_model.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<DeliveryStatus, int> orderStatusData =
      <DeliveryStatus, int>{}.obs;
  final RxMap<DeliveryStatus, double> totalAmounts =
      <DeliveryStatus, double>{}.obs;
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: DeliveryStatus.processing,
      totalAmount: 265,
      orderDate: DateTime.now().subtract(const Duration(days: 2)),
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
    ),
    OrderModel(
      id: 'CWT0025',
      status: DeliveryStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime.now().subtract(const Duration(days: 3)),
      deliveryDate: DateTime.now().add(const Duration(days: 4)),
    ),
    OrderModel(
      id: 'CWT0152',
      status: DeliveryStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime.now().add(const Duration(days: 4)),
      deliveryDate: DateTime.now().add(const Duration(days: 5)),
    ),
    OrderModel(
      id: 'CWT0150',
      status: DeliveryStatus.pending,
      totalAmount: 224,
      orderDate: DateTime.now().add(const Duration(days: 3)),
      deliveryDate: DateTime.now().add(const Duration(days: 5)),
    ),
    OrderModel(
      id: 'CWT0265',
      status: DeliveryStatus.pending,
      totalAmount: 355,
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now().add(const Duration(days: 6)),
    ),
    OrderModel(
      id: 'CWT1536',
      status: DeliveryStatus.delivered,
      totalAmount: 115,
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),
    OrderModel(
      id: 'CWT1530',
      status: DeliveryStatus.delivered,
      totalAmount: 215,
      orderDate: DateTime.now().subtract(const Duration(days: 3)),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),
    OrderModel(
      id: 'CWT1537',
      status: DeliveryStatus.cancelled,
      totalAmount: 115,
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySale();
    _calculateOrderStatusData();
    super.onInit();
  }

  void _calculateWeeklySale() {
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final DateTime orderWeekStart =
          SHelperFunctions.getStartOfWeek(order.orderDate);
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        //ensure index is non-negative
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;

        if (kDebugMode) {
          print(
              'Order date: ${order.orderDate},current weekday: $orderWeekStart, index:$index');
        }
      }
    }

    if (kDebugMode) {
      print('weekly sales: $weeklySales');
    }
  }

  void _calculateOrderStatusData() {
    ///clear
    orderStatusData.clear();
    ////Map to store total value of each status
    totalAmounts.value = {
      for (var status in DeliveryStatus.values) status: 0.0
    };
    for (var order in orders) {
      ///count order
      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;
      //////calculate total amounts
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }
}
