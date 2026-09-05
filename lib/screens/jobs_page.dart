import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/section_title.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الوظائف',
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
                          Icons.work_rounded,
                          color: AppColors.gold,
                          size: 38,
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'فرصتك القادمة تبدأ هنا',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'وظائف وفرص مهنية مختارة تساعدك في الوصول إلى خطوتك القادمة.',
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
                  title: 'أحدث الوظائف',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 180),
                child: const _JobCard(
                  title: 'مدرس لغة إنجليزية',
                  company: 'مدرسة دولية',
                  location: 'السعودية',
                  type: 'دوام كامل',
                  icon: Icons.language_rounded,
                ),
              ),
              const SizedBox(height: 14),
              FadeSlide(
                delay: const Duration(milliseconds: 240),
                child: const _JobCard(
                  title: 'مدرس Biology',
                  company: 'مؤسسة تعليمية',
                  location: 'الإمارات',
                  type: 'دوام كامل',
                  icon: Icons.biotech_rounded,
                ),
              ),
              const SizedBox(height: 14),
              FadeSlide(
                delay: const Duration(milliseconds: 300),
                child: const _JobCard(
                  title: 'مدرس أونلاين',
                  company: 'منصة تعليمية',
                  location: 'عن بُعد',
                  type: 'مرن',
                  icon: Icons.computer_rounded,
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 360),
                child: const SectionTitle(
                  title: 'نصيحة مهنية',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 420),
                child: GlowCard(
                  color: const Color(0xFFFFFCF2),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.lightbulb_rounded,
                          color: Color(0xFF9A7410),
                          size: 32,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            'حدّث سيرتك الذاتية باستمرار، وخصصها لكل وظيفة تتقدم إليها.',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.6,
                            ),
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

class _JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String type;
  final IconData icon;

  const _JobCard({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 27,
              ),
            ),
            const SizedBox(width: 14),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    company,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _InfoChip(
                        icon: Icons.location_on_outlined,
                        text: location,
                      ),
                      _InfoChip(
                        icon: Icons.schedule_rounded,
                        text: type,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
