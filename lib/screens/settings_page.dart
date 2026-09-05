import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';
import '../widgets/glow_card.dart';
import '../widgets/page_transition.dart';
import '../widgets/section_title.dart';
import 'about_app_page.dart';
import 'about_samgh_page.dart';
import 'contact_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageTransition(page: page),
    );
  }

  void _showComingSoon(
    BuildContext context,
    String title,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$title ستكون متاحة قريبًا',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openUrl(
    BuildContext context,
    String url,
  ) async {
    final Uri uri = Uri.parse(url);

    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تعذر فتح الرابط',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
                          'تعرّف على التطبيق وسامغ وتواصل معنا.',
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
                  title: 'عن التطبيق',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 180),
                child: GlowCard(
                  onTap: () {
                    _openPage(
                      context,
                      const AboutSamghPage(),
                    );
                  },
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
                  onTap: () {
                    _openPage(
                      context,
                      const AboutAppPage(),
                    );
                  },
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
                  title: 'تواصل مع سامغ',
                ),
              ),
              const SizedBox(height: 12),
              FadeSlide(
                delay: const Duration(milliseconds: 360),
                child: GlowCard(
                  onTap: () {
                    _openPage(
                      context,
                      const ContactPage(),
                    );
                  },
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
                  onTap: () {
                    _openPage(
                      context,
                      const ContactPage(),
                    );
                  },
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
                  onTap: () {
                    _showComingSoon(
                      context,
                      'الإشعارات',
                    );
                  },
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
                  onTap: () {
                    _showComingSoon(
                      context,
                      'المظهر',
                    );
                  },
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
                  onTap: () {
                    _showComingSoon(
                      context,
                      'اللغة',
                    );
                  },
                  child: const _SettingsTile(
                    icon: Icons.language_rounded,
                    title: 'اللغة',
                    subtitle: 'العربية',
                  ),
                ),
              ),
              const SizedBox(height: 42),
              const Center(
                child: Text(
                  'Samig Treasure',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'Developed by Alaeldin Khader',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _DeveloperSocialButton(
                    icon: Icons.facebook_rounded,
                    onTap: () {
                      _openUrl(
                        context,
                        'https://www.facebook.com/profile.php?id=100065331340861',
                      );
                    },
                  ),
                  const SizedBox(width: 14),
                  _DeveloperSocialButton(
                    icon: Icons.phone_rounded,
                    onTap: () {
                      _openUrl(
                        context,
                        'https://wa.me/249117179675',
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
              color: AppColors.primary.withValues(alpha: 0.10),
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

class _DeveloperSocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _DeveloperSocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryDark.withValues(alpha: 0.22),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 27,
          ),
        ),
      ),
    );
  }
}
