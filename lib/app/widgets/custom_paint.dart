import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffEEEEEE)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.quadraticBezierTo(
        0, size.height * 0.4950000, 0, size.height * 0.3266667);
    path_0.quadraticBezierTo(size.width * 0.0009286, size.height * 0.0152667,
        size.width * 0.0713857, size.height * 0.0132000);
    path_0.quadraticBezierTo(size.width * 0.1026571, size.height * 0.0182000,
        size.width * 0.1433714, size.height * 0.0582000);
    path_0.quadraticBezierTo(size.width * 0.3585714, size.height * 0.3076667,
        size.width, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
