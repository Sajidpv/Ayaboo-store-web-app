import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:store/common/widgets/animations/translate_on_hover.dart';

extension HoverExtension on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
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

extension ConditionalHoverExtension on Widget {
  Widget get applyHoverEffectIfWeb {
    return kIsWeb ? moveUpOnHover : this;
  }
}

extension ConditionalCursorOnHoverExtension on Widget {
  Widget get showCursorOnHoverIfWeb {
    return kIsWeb ? showCursorOnHover : this;
  }
}
