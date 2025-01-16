import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FloatingDraggableWidget extends StatefulWidget {
  final Widget floatingWidget;
  final Widget? mainScreenWidget;
  final double floatingWidgetHeight;
  final double floatingWidgetWidth;
  final double? dx;
  final double? dy;

  const FloatingDraggableWidget({
    super.key,
    required this.floatingWidget,
    this.mainScreenWidget,
    required this.floatingWidgetHeight,
    required this.floatingWidgetWidth,
    this.dx,
    this.dy,
  });

  @override
  State<FloatingDraggableWidget> createState() =>
      _FloatingDraggableWidgetState();
}

class _FloatingDraggableWidgetState extends State<FloatingDraggableWidget> {
  late double dx;
  late double dy;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      setState(() {
        dx = widget.dx ?? (screenWidth - widget.floatingWidgetWidth) / 2;
        dy = widget.dy ?? (screenHeight - widget.floatingWidgetHeight) / 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    final screenHeight = context.height;

    return Stack(
      children: [
        if (widget.mainScreenWidget != null) widget.mainScreenWidget!,
        Positioned(
          left: dx,
          top: dy,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (details) {
              setState(() {
                dx = (dx + details.delta.dx).clamp(
                  0.0,
                  screenWidth - widget.floatingWidgetWidth,
                );
                dy = (dy + details.delta.dy).clamp(
                  0.0,
                  screenHeight - widget.floatingWidgetHeight,
                );
              });
            },
            onPanEnd: (_) {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              width: widget.floatingWidgetWidth,
              height: widget.floatingWidgetHeight,
              child: AbsorbPointer(
                absorbing: false,
                child: widget.floatingWidget,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
