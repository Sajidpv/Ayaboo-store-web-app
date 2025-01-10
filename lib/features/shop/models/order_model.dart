import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id, userId, docId, paymentMethod;
  final DefaultStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime? deliveryDate;

  OrderModel({
    this.userId = '',
    this.docId = '',
    this.paymentMethod = 'paypal',
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.deliveryDate,
  });
  String get formattedOrderDate => SHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate => deliveryDate != null
      ? SHelperFunctions.getFormattedDate(deliveryDate!)
      : '';
  String get orderStatusText => status == DefaultStatus.delivered
      ? 'Delivered'
      : status == DefaultStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  /// Static function to create an empty user model.
  static OrderModel empty() => OrderModel(
      id: '',
      orderDate: DateTime.now(),
      status: DefaultStatus.pending,
      totalAmount: 0);
}
