// Only for Web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:store/common/widgets/animations/translate_on_hover.dart';

extension HoverExtension on Widget {
  Widget get showCursorOnHover {
    final appContainer = html.window.document.getElementById('app-container');
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer?.style.cursor = 'pointer',
      onExit: (event) => appContainer?.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
