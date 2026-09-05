import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/section_title.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الكورسات',
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            children: [
              FadeSlide(
                child: GlowCard(
                  color: AppColors.primaryDark,
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.school_rounded,
                          color: AppColors.gold,
                          size: 38,
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'تعلّم مهارة جديدة',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          'كورسات مختارة تساعدك على التطور خطوة بخطوة.',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 120),
                child: const SectionTitle(
                  title: 'الكورسات المقترحة',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 180),
                child: GlowCard(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        _CourseIcon(
                          icon: Icons.language_rounded,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: _CourseInfo(
                            title: 'أساسيات اللغة الإنجليزية',
                            subtitle: 'ابدأ من الأساس وطوّر مهاراتك.',
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              FadeSlide(
                delay: const Duration(milliseconds: 240),
                child: GlowCard(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        _CourseIcon(
                          icon: Icons.design_services_rounded,
                          color: AppColors.accent,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: _CourseInfo(
                            title: 'Canva للمبتدئين',
                            subtitle: 'تعلّم أساسيات التصميم بطريقة بسيطة.',
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              FadeSlide(
                delay: const Duration(milliseconds: 300),
                child: GlowCard(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        _CourseIcon(
                          icon: Icons.cast_for_education_rounded,
                          color: Color(0xFF9A7410),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: _CourseInfo(
                            title: 'مهارات التدريس',
                            subtitle: 'أفكار وأدوات لتطوير مهارات المعلم.',
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 360),
                child: const SectionTitle(
                  title: 'قريبًا',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 420),
                child: GlowCard(
                  color: const Color(0xFFFFF5FB),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.auto_awesome_rounded,
                          color: AppColors.accent,
                          size: 32,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'المزيد من الكورسات',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'سيتم إضافة محتوى جديد باستمرار.',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
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

class _CourseIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CourseIcon({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Icon(
        icon,
        color: color,
        size: 27,
      ),
    );
  }
}

class _CourseInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const _CourseInfo({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
