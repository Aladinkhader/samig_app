import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/app_logo.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'عن التطبيق',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
            children: [
              FadeSlide(
                child: const Center(
                  child: AppLogo(
                    size: 78,
                    showSubtitle: true,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeSlide(
                delay: const Duration(milliseconds: 120),
                child: GlowCard(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'عن كنوز سامغ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'كنوز سامغ منصة تجمع محتوى تعليميًا وفرصًا مهنية وتعليمية في مكان واحد، لتساعدك على التعلم والتطور واكتشاف الفرص المناسبة لك.',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              FadeSlide(
                delay: const Duration(milliseconds: 200),
                child: GlowCard(
                  color: const Color(0xFFF8F2FF),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'ماذا ستجد في التطبيق؟',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _FeatureItem(
                          icon: Icons.language_rounded,
                          text: 'محتوى لتعلم وتطوير اللغة الإنجليزية',
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          icon: Icons.school_rounded,
                          text: 'كورسات ومصادر تعليمية مختارة',
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          icon: Icons.work_rounded,
                          text: 'وظائف وفرص مهنية',
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          icon: Icons.public_rounded,
                          text: 'منح وتدريبات ومؤتمرات وفرص متنوعة',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              FadeSlide(
                delay: const Duration(milliseconds: 280),
                child: GlowCard(
                  color: const Color(0xFFFFF5FB),
                  child: const Padding(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'رؤيتنا',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'أن نجعل الوصول إلى المعرفة والفرص أسهل، وأن نحول المحتوى المفيد إلى تجربة بسيطة وعصرية.',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Samig Treasure',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  'الإصدار 1.0.0',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
