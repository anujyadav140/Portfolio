import 'package:flutter/material.dart';

class AnimatedTextReveal extends StatelessWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final Duration delay;
  final TextAlign? textAlign;

  const AnimatedTextReveal({
    super.key,
    required this.controller,
    required this.text,
    this.style,
    this.delay = Duration.zero,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final delayFraction = delay.inMilliseconds / controller.duration!.inMilliseconds;
    final effectiveFraction = (1.0 - delayFraction).clamp(0.0, 1.0);
    
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final animationValue = Curves.easeOut.transform(
          ((controller.value - delayFraction) / effectiveFraction).clamp(0.0, 1.0),
        );
        
        return Transform.translate(
          offset: Offset(0, 30 * (1 - animationValue)),
          child: Opacity(
            opacity: animationValue,
            child: Text(
              text,
              style: style,
              textAlign: textAlign,
            ),
          ),
        );
      },
    );
  }
}