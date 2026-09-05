import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/section_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
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
                  child: const Padding(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.settings_rounded,
                          color: AppColors.gold,
                          size: 36,
                        ),
                        SizedBox(height: 14),
                        Text(
                          'إعدادات كنوز سامغ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'خصّص تجربتك داخل التطبيق.',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
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
                  title: 'عن التطبيق',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 180),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.person_rounded,
                    title: 'عن سامغ',
                    subtitle: 'تعرّف على سامغ ومجالات اهتمامه',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 240),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.info_outline_rounded,
                    title: 'عن كنوز سامغ',
                    subtitle: 'معلومات عن التطبيق وفكرته',
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 300),
                child: const SectionTitle(
                  title: 'تواصل',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 360),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.chat_rounded,
                    title: 'تواصل مع سامغ',
                    subtitle: 'للاستفسارات والاقتراحات والتعاون',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 420),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.facebook_rounded,
                    title: 'صفحة سامغ على Facebook',
                    subtitle: 'تابع أحدث المحتوى والمنشورات',
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeSlide(
                delay: const Duration(milliseconds: 480),
                child: const SectionTitle(
                  title: 'التطبيق',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 540),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.notifications_rounded,
                    title: 'الإشعارات',
                    subtitle: 'إدارة إشعارات التطبيق',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 600),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.dark_mode_rounded,
                    title: 'المظهر',
                    subtitle: 'الوضع الفاتح والداكن',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 660),
                child: GlowCard(
                  onTap: () {},
                  child: const _SettingsTile(
                    icon: Icons.language_rounded,
                    title: 'اللغة',
                    subtitle: 'العربية',
                  ),
                ),
              ),
              const SizedBox(height: 30),
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

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 25,
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
                const SizedBox(height: 4),
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
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
            size: 17,
          ),
        ],
      ),
    );
  }
}
