import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'animated_press.dart';

class GlowCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final double borderRadius;
  final bool glow;

  const GlowCard({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.borderRadius = 22,
    this.glow = true,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cardColor = widget.color ?? AppColors.surface;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -4 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withOpacity(
                widget.glow ? 0.14 : 0.08,
              ),
              blurRadius: _isHovered ? 24 : 14,
              spreadRadius: _isHovered ? 1 : 0,
              offset: Offset(
                0,
                _isHovered ? 10 : 6,
              ),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: AnimatedPress(
            onTap: widget.onTap,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
