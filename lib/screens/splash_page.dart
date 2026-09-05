import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onFinished;

  const SplashPage({
    super.key,
    required this.onFinished,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _glowAnimation;

  Timer? _timer;

  final String _name = 'Samig';
  int _visibleLetters = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _glowAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _startLetterAnimation();
  }

  void _startLetterAnimation() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 230),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          if (_visibleLetters < _name.length) {
            _visibleLetters++;
          }
        });

        if (_visibleLetters == _name.length) {
          timer.cancel();

          Future.delayed(
            const Duration(milliseconds: 900),
            () {
              if (mounted) {
                widget.onFinished();
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: _glowCircle(
              size: 300,
              color: AppColors.primary.withValues(alpha: 0.28),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: _glowCircle(
              size: 320,
              color: AppColors.accent.withValues(alpha: 0.18),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.75 + (_scaleAnimation.value * 0.25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSamig(),
                      const SizedBox(height: 12),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 600),
                        opacity: _visibleLetters == _name.length ? 1 : 0,
                        child: const Text(
                          'Treasure',
                          style: TextStyle(
                            color: AppColors.gold,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        opacity: _visibleLetters == _name.length ? 1 : 0,
                        child: Container(
                          width: 55,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gold.withValues(alpha: 0.55),
                                blurRadius:
                                    12 + (_glowAnimation.value * 8),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSamig() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _name.length,
        (index) {
          final bool visible = index < _visibleLetters;

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 180),
            opacity: visible ? 1 : 0,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              offset: visible ? Offset.zero : const Offset(0, 0.7),
              child: Text(
                _name[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      color: AppColors.primary.withValues(alpha: 0.8),
                      blurRadius: 22,
                    ),
                    Shadow(
                      color: AppColors.accent.withValues(alpha: 0.45),
                      blurRadius: 35,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _glowCircle({
    required double size,
    required Color color,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 100,
            spreadRadius: 30,
          ),
        ],
      ),
    );
  }
}
