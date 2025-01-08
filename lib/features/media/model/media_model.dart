// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:store/utils/formatters/formatter.dart';

class ImageModel {
  String id;
  final String url;
  final String folder;
  final String fileName;
  String mediaCategory;
  final String? contentType;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? sizeBytes;

  final DropzoneFileInterface? file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;
  ImageModel({
    required this.url,
    required this.folder,
    this.contentType,
    this.createdAt,
    this.file,
    this.localImageToDisplay,
    this.id = '',
    required this.fileName,
    this.mediaCategory = '',
    this.fullPath,
    this.updatedAt,
    this.sizeBytes,
  });
  static ImageModel empty() => ImageModel(url: '', folder: '', fileName: '');

  String get createdAtFormated => SFormatter.formatDate(createdAt);
  String get updatedAtFormated => SFormatter.formatDate(updatedAt);
}
