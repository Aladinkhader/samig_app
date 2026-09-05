import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/section_title.dart';

class EnglishPage extends StatelessWidget {
  const EnglishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تعلم الإنجليزية',
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
                          Icons.language_rounded,
                          color: AppColors.gold,
                          size: 38,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'طوّر لغتك الإنجليزية',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'تعلم بطريقة بسيطة، عملية وممتعة.',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'ابدأ بخطوة واحدة اليوم ✨',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 100),
                child: SectionTitle(
                  title: 'محتوى اليوم',
                  actionText: 'عرض الكل',
                  onAction: () {},
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
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Color(0xFFF0E8FF),
                          child: Icon(
                            Icons.menu_book_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'كلمة اليوم',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Opportunity — فرصة',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
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
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Color(0xFFFFF5D9),
                          child: Icon(
                            Icons.headphones_rounded,
                            color: Color(0xFF9A7410),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'استمع وتعلّم',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'تدريب قصير لتحسين الاستماع',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
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
                delay: const Duration(milliseconds: 300),
                child: SectionTitle(
                  title: 'تحديات الإنجليزية',
                  actionText: 'المزيد',
                  onAction: () {},
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 360),
                child: GlowCard(
                  color: const Color(0xFFFFF5FB),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: AppColors.accent,
                          size: 34,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تحدي 7 أيام',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'خطوة صغيرة كل يوم تصنع فرقًا كبيرًا.',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.accent,
                          size: 18,
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
