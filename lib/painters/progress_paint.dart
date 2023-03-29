import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  Color? backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor!
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color!;
    double progress = (1.0 - animation!.value) * 2;
    canvas.drawArc(Offset.zero & size, 23, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CirclePainter old) {
    return animation!.value != old.animation!.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
