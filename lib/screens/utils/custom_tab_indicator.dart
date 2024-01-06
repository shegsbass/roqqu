import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends Decoration {
  late final Color color;
  late final double indicatorHeight;
  late final double cornerRadius;

  CustomIndicator({
    required this.color,
    required this.indicatorHeight,
    this.cornerRadius = 8,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      color: color,
      indicatorHeight: indicatorHeight,
      cornerRadius: cornerRadius,
    );
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  final Paint _fillPaint;
  final Paint _strokePaint;
  final double indicatorHeight;
  final double cornerRadius;

  _CustomIndicatorPainter({
    required Color color,
    required this.indicatorHeight,
    required this.cornerRadius,
  })  : _fillPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill,
        _strokePaint = Paint()
          ..color = color
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final double indicatorTop = rect.bottom - indicatorHeight;
    final Rect indicatorRect = Rect.fromPoints(
      Offset(rect.left, indicatorTop),
      Offset(rect.right, rect.bottom),
    );
    final RRect roundedRect = RRect.fromRectAndRadius(indicatorRect, Radius.circular(cornerRadius));

    // Draw the filled indicator
    canvas.drawRRect(roundedRect, _fillPaint);

    // Draw the stroke around the indicator
    canvas.drawRRect(roundedRect, _strokePaint);
  }
}