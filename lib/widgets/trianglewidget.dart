
import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    double triangleSize = size.height < size.width ? size.height : size.width;

    Path path = Path();

    path.moveTo(0, triangleSize);
    path.lineTo(0, 0);
    path.lineTo(triangleSize, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
