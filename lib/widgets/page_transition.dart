import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition({
    required this.page,
  }) : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );

            final slideAnimation = Tween<Offset>(
              begin: const Offset(0.08, 0),
              end: Offset.zero,
            ).animate(curvedAnimation);

            final fadeAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(curvedAnimation);

            final scaleAnimation = Tween<double>(
              begin: 0.97,
              end: 1.0,
            ).animate(curvedAnimation);

            return FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: child,
                ),
              ),
            );
          },
        );
}
