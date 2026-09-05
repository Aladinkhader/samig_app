import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFF7F6FA),
            Color(0xFFF0EAF8),
            Color(0xFFF7F6FA),
          ],
          stops: [
            0.0,
            0.5,
            1.0,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: _GlowCircle(
              size: 220,
              color: AppColors.primary.withOpacity(0.08),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -100,
            child: _GlowCircle(
              size: 260,
              color: AppColors.accent.withOpacity(0.06),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 90,
              spreadRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
