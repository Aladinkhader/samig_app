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
  bool _isPressed = false;
  bool _isHovered = false;

  void _setPressed(bool value) {
    if (_isPressed == value) {
      return;
    }

    setState(() {
      _isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = widget.color ?? AppColors.surface;

    final bool lifted = _isPressed || _isHovered;

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
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(
            0,
            lifted ? -7 : 0,
            0,
          ),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryDark.withValues(
                  alpha: lifted
                      ? (widget.glow ? 0.20 : 0.12)
                      : (widget.glow ? 0.13 : 0.08),
                ),
                blurRadius: lifted ? 25 : 14,
                spreadRadius: lifted ? 1 : 0,
                offset: Offset(
                  0,
                  lifted ? 14 : 6,
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
      ),
    );
  }
}
