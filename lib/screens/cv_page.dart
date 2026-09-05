import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/fade_slide.dart';
import '../widgets/gradient_background.dart';

class CvPage extends StatefulWidget {
  const CvPage({super.key});

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _summaryController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _languagesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _summaryController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    _languagesController.dispose();
    super.dispose();
  }

  void _analyzeCv() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    int score = 0;

    final fields = [
      _nameController.text,
      _jobTitleController.text,
      _emailController.text,
      _phoneController.text,
      _locationController.text,
      _summaryController.text,
      _educationController.text,
      _experienceController.text,
      _skillsController.text,
      _languagesController.text,
    ];

    for (final field in fields) {
      if (field.trim().isNotEmpty) {
        score += 10;
      }
    }

    _showScore(score);
  }

  void _showScore(int score) {
    String message;

    if (score >= 80) {
      message = 'سيرتك تحتوي على معظم العناصر الأساسية.';
    } else if (score >= 60) {
      message = 'السيرة جيدة، ويمكن تحسين بعض الأقسام.';
    } else {
      message = 'أكمل المزيد من البيانات لتحسين توافق السيرة.';
    }

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.gold,
                size: 44,
              ),
              const SizedBox(height: 12),
              const Text(
                'ATS Score',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$score%',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'حسنًا',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    String? hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: AppColors.primary,
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }

  Widget _field({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool required = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: _decoration(
          label: label,
          icon: icon,
          hint: hint,
        ),
        validator: required
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'منشئ السيرة الذاتية',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              children: [
                FadeSlide(
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(
                            alpha: 0.22,
                          ),
                          blurRadius: 25,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.description_rounded,
                          color: AppColors.gold,
                          size: 42,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Text(
                                'أنشئ CV احترافي',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'سيرة ذاتية منظمة ومناسبة لأنظمة ATS',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                const _CvSectionTitle(
                  title: 'المعلومات الشخصية',
                  icon: Icons.person_rounded,
                ),
                const SizedBox(height: 12),
                _field(
                  label: 'الاسم الكامل',
                  icon: Icons.badge_rounded,
                  controller: _nameController,
                  required: true,
                ),
                _field(
                  label: 'المسمى الوظيفي',
                  icon: Icons.work_rounded,
                  controller: _jobTitleController,
                  hint: 'مثال: Flutter Developer',
                  required: true,
                ),
                _field(
                  label: 'البريد الإلكتروني',
                  icon: Icons.email_rounded,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  required: true,
                ),
                _field(
                  label: 'رقم الهاتف',
                  icon: Icons.phone_rounded,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                _field(
                  label: 'الموقع',
                  icon: Icons.location_on_rounded,
                  controller: _locationController,
                  hint: 'المدينة، الدولة',
                ),
                const SizedBox(height: 10),
                const _CvSectionTitle(
                  title: 'الملخص المهني',
                  icon: Icons.auto_awesome_rounded,
                ),
                const SizedBox(height: 12),
                _field(
                  label: 'نبذة مهنية',
                  icon: Icons.notes_rounded,
                  controller: _summaryController,
                  hint: 'اكتب نبذة مختصرة عن خبرتك ومهاراتك',
                  maxLines: 5,
                  required: true,
                ),
                const SizedBox(height: 10),
                const _CvSectionTitle(
                  title: 'التعليم والخبرة',
                  icon: Icons.school_rounded,
                ),
                const SizedBox(height: 12),
                _field(
                  label: 'التعليم',
                  icon: Icons.school_rounded,
                  controller: _educationController,
                  hint: 'المؤهل، الجامعة، التخصص، سنة التخرج',
                  maxLines: 4,
                ),
                _field(
                  label: 'الخبرة العملية',
                  icon: Icons.business_center_rounded,
                  controller: _experienceController,
                  hint: 'الشركة، المسمى، المدة، أهم الإنجازات',
                  maxLines: 6,
                ),
                const SizedBox(height: 10),
                const _CvSectionTitle(
                  title: 'المهارات واللغات',
                  icon: Icons.psychology_rounded,
                ),
                const SizedBox(height: 12),
                _field(
                  label: 'المهارات',
                  icon: Icons.star_rounded,
                  controller: _skillsController,
                  hint: 'مثال: Flutter, Dart, GitHub, UI/UX',
                  maxLines: 4,
                  required: true,
                ),
                _field(
                  label: 'اللغات',
                  icon: Icons.language_rounded,
                  controller: _languagesController,
                  hint: 'مثال: العربية - ممتاز، الإنجليزية - جيد جدًا',
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                FadeSlide(
                  delay
