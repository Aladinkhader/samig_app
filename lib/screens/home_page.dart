import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/app_logo.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/section_card.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FadeSlide(
                  delay: const Duration(milliseconds: 100),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'مرحبًا بك 👋',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'اكتشف كنوزك اليوم',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const AppLogo(
                          size: 52,
                          showSubtitle: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeSlide(
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryDark.withOpacity(0.22),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppColors.gold.withOpacity(0.18),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.auto_awesome_rounded,
                              color: AppColors.gold,
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'كنوز سامغ',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'تعلّم، تطوّر، واكتشف فرصًا جديدة',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    height: 1.4,
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
              ),
              SliverToBoxAdapter(
                child: FadeSlide(
                  delay: const Duration(milliseconds: 300),
                  child: const SectionTitle(
                    title: 'اكتشف الأقسام',
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      FadeSlide(
                        delay: const Duration(milliseconds: 350),
                        child: SectionCard(
                          title: 'تعلم الإنجليزية',
                          subtitle: 'دروس ومحتوى يساعدك على تطوير لغتك',
                          icon: Icons.language_rounded,
                          color: Colors.white,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 14),
                      FadeSlide(
                        delay: const Duration(milliseconds: 400),
                        child: SectionCard(
                          title: 'الكورسات',
                          subtitle: 'اكتشف دورات تعليمية مفيدة ومتنوعة',
                          icon: Icons.school_rounded,
                          color: const Color(0xFFFFFCF2),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 14),
                      FadeSlide(
                        delay: const Duration(milliseconds: 450),
                        child: SectionCard(
                          title: 'الوظائف',
                          subtitle: 'فرص عمل مختارة ومصادر للتقديم',
                          icon: Icons.work_outline_rounded,
                          color: const Color(0xFFF8F2FF),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 14),
                      FadeSlide(
                        delay: const Duration(milliseconds: 500),
                        child: SectionCard(
                          title: 'الفرص',
                          subtitle: 'منح وتدريب ومؤتمرات وفرص تعليمية',
                          icon: Icons.public_rounded,
                          color: const Color(0xFFFFF5FB),
                          onTap: () {},
                        ),
                      ),
                    ],
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
