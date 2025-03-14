import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';

class SHelperFunctions {
  static DateTime getStartOfWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(
        startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0, 0, 0);
  }

  static Color getDeliveryStatusColor(DeliveryStatus value) {
    if (DeliveryStatus.pending == value) {
      return Colors.blue;
    } else if (DeliveryStatus.processing == value) {
      return Colors.orange;
    } else if (DeliveryStatus.shipped == value) {
      return Colors.purple;
    } else if (DeliveryStatus.delivered == value) {
      return Colors.green;
    } else if (DeliveryStatus.cancelled == value) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  static Color getVerificationStatusColor(VerificationStatus value) {
    if (VerificationStatus.pending == value) {
      return Colors.blue;
    } else if (VerificationStatus.approved == value) {
      return Colors.green;
    } else if (VerificationStatus.rejected == value) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  static Color getPaymentStatusColor(PaymentStatus value) {
    if (PaymentStatus.pending == value) {
      return Colors.blue;
    } else if (PaymentStatus.paid == value) {
      return Colors.green;
    } else if (PaymentStatus.failed == value) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  static Color getReturnStatusColor(ReturnStatus value) {
    if (ReturnStatus.pending == value) {
      return Colors.blue;
    } else if (ReturnStatus.recieved == value) {
      return Colors.greenAccent;
    } else if (ReturnStatus.accepted == value) {
      return Colors.green;
    } else if (ReturnStatus.rejected == value) {
      return Colors.red;
    } else if (ReturnStatus.replaced == value) {
      return Colors.orange;
    } else if (ReturnStatus.ontransist == value) {
      return Colors.yellow;
    } else if (ReturnStatus.refunded == value) {
      return Colors.purpleAccent;
    } else {
      return Colors.grey;
    }
  }

  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return TColors.primary;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
