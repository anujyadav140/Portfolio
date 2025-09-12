import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'dart:math' as math;

class GeometricBackground extends StatefulWidget {
  const GeometricBackground({super.key});

  @override
  State<GeometricBackground> createState() => _GeometricBackgroundState();
}

class _GeometricBackgroundState extends State<GeometricBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: GeometricBackgroundPainter(_animation.value),
          size: size,
        );
      },
    );
  }
}

class GeometricBackgroundPainter extends CustomPainter {
  final double animationValue;

  GeometricBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MinimalistTheme.borderGray.withValues(alpha: 0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw subtle geometric lines
    final center = Offset(size.width * 0.7, size.height * 0.4);
    final radius = 200.0;
    
    // Rotating circles
    for (int i = 0; i < 3; i++) {
      final offset = i * 60.0;
      final currentRadius = radius + (i * 50);
      final rotation = animationValue * 360 + offset;
      
      final x = center.dx + currentRadius * 0.5 * math.cos(rotation * math.pi / 180);
      final y = center.dy + currentRadius * 0.5 * math.sin(rotation * math.pi / 180);
      
      canvas.drawCircle(
        Offset(x, y),
        currentRadius * 0.3,
        paint..color = MinimalistTheme.borderGray.withValues(alpha: 0.1 - i * 0.02),
      );
    }

    // Static grid lines
    final gridPaint = Paint()
      ..color = MinimalistTheme.borderGray.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    const gridSize = 50.0;
    
    // Vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }
    
    // Horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}