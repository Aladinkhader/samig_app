import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/app_logo.dart';

class AboutSamghPage extends StatelessWidget {
  const AboutSamghPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'عن سامغ',
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
                    size: 82,
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
                          'من هو سامغ؟',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'سامغ مهتم بالتعليم وتطوير المهارات، ويشارك محتوى تعليميًا وفرصًا مفيدة تساعد المتابعين على التعلم والتطور والوصول إلى فرص جديدة.',
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
                          'ماذا يقدم؟',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _AboutItem(
                          icon: Icons.language_rounded,
                          title: 'تعلم الإنجليزية',
                          description: 'محتوى يساعدك على تطوير مهارات اللغة.',
                        ),
                        const SizedBox(height: 14),
                        _AboutItem(
                          icon: Icons.school_rounded,
                          title: 'التعليم والكورسات',
                          description: 'مصادر ودورات وأدوات تعليمية مفيدة.',
                        ),
                        const SizedBox(height: 14),
                        _AboutItem(
                          icon: Icons.work_rounded,
                          title: 'الوظائف والفرص',
                          description: 'فرص مهنية وتعليمية مختارة.',
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
                          'الرؤية',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'تقديم محتوى وفرص مفيدة في مكان واحد، بطريقة بسيطة وعصرية تساعدك على الاستفادة من وقتك وتطوير مستقبلك.',
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
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 23,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
