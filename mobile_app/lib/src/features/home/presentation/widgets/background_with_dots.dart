import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundWithDots extends StatelessWidget {
  final Widget child;

  const BackgroundWithDots({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFCE4EC), // وردي فاتح
            Color(0xFFF8BBD0), // وردي متوسط
            Color(0xFFF48FB1), // وردي غامق
          ],
        ),
      ),
      child: Stack(
        children: [
          // النقاط البيضاء
          Positioned.fill(child: CustomPaint(painter: DotsPainter())),
          // المحتوى
          child,
        ],
      ),
    );
  }
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final random = Random(42); // seed ثابت لنتائج متشابهة
    final dotCount = 50; // عدد النقاط
    final minRadius = 2.0;
    final maxRadius = 8.0;

    for (int i = 0; i < dotCount; i++) {
      final radius = minRadius + random.nextDouble() * (maxRadius - minRadius);
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
