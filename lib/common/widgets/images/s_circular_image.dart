import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.padding = TSizes.sm,
      this.fit = BoxFit.cover,
      this.image,
      this.file,
      this.imageType = ImageType.svg,
      this.overlayColor,
      this.backgroundColor,
      this.memoryImage});

  final double width, height, padding;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (Theme.of(context).brightness == Brightness.dark
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(width >= height ? width : height),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
      case ImageType.svg:
        imageWidget = _buildSvgImage();
        break;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(width >= height ? width : height),
      child: imageWidget,
    );
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(
        image: AssetImage(image!),
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildSvgImage() {
    if (image != null) {
      return SvgPicture.asset(
        image!,
        fit: fit!,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(
        image: FileImage(file!),
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        image: MemoryImage(memoryImage!),
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overlayColor,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  }
}
