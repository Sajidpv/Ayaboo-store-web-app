import 'package:get/get.dart';

class ReportController extends GetxController {
  static ReportController get instance => Get.find();
  final List<Map<String, dynamic>> data = [
    {
      'name': 'Leggings',
      'sizeno': 5,
      'colorno': 1,
      'age': 29,
      'details': 'Additional details about John Doe.',
      'child': [
        {
          'color': 'Red',
          'sizes': [
            {
              'size': 'S',
              'quantity': 29,
            },
            {
              'size': 'M',
              'quantity': 2,
            },
            {
              'size': 'L',
              'quantity': 9,
            },
            {
              'size': 'XL',
              'quantity': 900,
            },
            {
              'size': 'XXL',
              'quantity': 109,
            },
          ]
        },
      ]
    },
    {
      'name': 'Jeans',
      'sizeno': 4,
      'colorno': 3,
      'age': 34,
      'details': 'Additional details about Jane Smith.',
      'child': [
        {
          'color': 'Red',
          'sizes': [
            {
              'size': 'S',
              'quantity': 29,
            },
            {
              'size': 'M',
              'quantity': 2,
            },
            {
              'size': 'L',
              'quantity': 9,
            },
          ]
        },
        {
          'color': 'blue',
          'sizes': [
            {
              'size': 'S',
              'quantity': 29,
            },
          ]
        },
        {
          'color': 'green',
          'sizes': [
            {
              'size': 'S',
              'quantity': 29,
            },
            {
              'size': 'XS',
              'quantity': 9,
            },
          ]
        },
      ]
    },
    {
      'name': 'Teachers ',
      'sizeno': 3,
      'colorno': 2,
      'age': 25,
      'details': 'Additional details about Mike Johnson.',
      'child': [
        {
          'color': 'Red',
          'sizes': [
            {
              'size': 'XL',
              'quantity': 29,
            },
            {
              'size': 'XXL',
              'quantity': 2,
            },
            {
              'size': 'XXXL',
              'quantity': 9,
            },
          ]
        },
        {
          'color': 'blue',
          'sizes': [
            {
              'size': 'XL',
              'quantity': 29,
            },
          ]
        },
      ]
    },
  ];
  final RxList<bool> expandedRows = RxList.generate(20, (_) => false);

  void expandTableRow(index) {
    expandedRows[index] = !expandedRows[index];
  }
}
