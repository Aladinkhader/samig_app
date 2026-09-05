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

  double get _completion {
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

    final completed =
        fields.where((field) => field.trim().isNotEmpty).length;

    return completed / fields.length;
  }

  int get _completionPercent => (_completion * 100).round();

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
    String title;
    String message;

    if (score >= 80) {
      title = 'بداية ممتازة';
      message = 'سيرتك تحتوي على معظم العناصر الأساسية.';
    } else if (score >= 60) {
      title = 'سيرة جيدة';
      message = 'السيرة جيدة، ويمكن تحسين بعض الأقسام.';
    } else {
      title = 'تحتاج إلى تحسين';
      message = 'أكمل المزيد من البيانات لتحسين توافق السيرة.';
    }

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
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
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.14),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.gold,
                  size: 40,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'ATS Score',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$score%',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                message,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.6,
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
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Text(
                    'حسنًا',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
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

  void _openPreview() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CvPreviewPage(
          name: _nameController.text.trim(),
          jobTitle: _jobTitleController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          location: _locationController.text.trim(),
          summary: _summaryController.text.trim(),
          education: _educationController.text.trim(),
          experience: _experienceController.text.trim(),
          skills: _skillsController.text.trim(),
          languages: _languagesController.text.trim(),
        ),
      ),
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
        fontWeight: FontWeight.w600,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.4,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.3,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
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

  Widget _section({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 5),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          ...children,
        ],
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
              children: [
                FadeSlide(
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(27),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(
                            alpha: 0.23,
                          ),
                          blurRadius: 27,
                          offset: const Offset(0, 13),
                        ),
                      ],
                    ),
                    child: const Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.description_rounded,
                          color: AppColors.gold,
                          size: 43,
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
                              SizedBox(height: 6),
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
                const SizedBox(height: 18),
                FadeSlide(
                  delay: const Duration(milliseconds: 100),
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(
                            alpha: 0.07,
                          ),
                          blurRadius: 16,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            const Icon(
                              Icons.insights_rounded,
                              color: AppColors.primary,
                              size: 23,
                            ),
                            const SizedBox(width: 9),
                            const Expanded(
                              child: Text(
                                'اكتمال السيرة',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Text(
                              '$_completionPercent%',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 11),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: _completion,
                            minHeight: 8,
                            backgroundColor:
                                AppColors.primary.withValues(
                              alpha: 0.10,
                            ),
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FadeSlide(
                  delay: const Duration(milliseconds: 150),
                  child: _section(
                    title: 'المعلومات الشخصية',
                    icon: Icons.person_rounded,
                    children: [
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
                    ],
                  ),
                ),
                FadeSlide(
                  delay: const Duration(milliseconds: 200),
                  child: _section(
                    title: 'الملخص المهني',
                    icon: Icons.auto_awesome_rounded,
                    children: [
                      _field(
                        label: 'نبذة مهنية',
                        icon: Icons.notes_rounded,
                        controller: _summaryController,
                        hint: 'اكتب نبذة مختصرة عن خبرتك ومهاراتك',
                        maxLines: 5,
                        required: true,
                      ),
                    ],
                  ),
                ),
                FadeSlide(
                  delay: const Duration(milliseconds: 250),
                  child: _section(
                    title: 'التعليم والخبرة',
                    icon: Icons.school_rounded,
                    children: [
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
                    ],
                  ),
                ),
                FadeSlide(
                  delay: const Duration(milliseconds: 300),
                  child: _section(
                    title: 'المهارات واللغات',
                    icon: Icons.psychology_rounded,
                    children: [
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
                    ],
                  ),
                ),
                FadeSlide(
                  delay: const Duration(milliseconds: 350),
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withValues(alpha: 0.11),
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(
                        color: AppColors.gold.withValues(alpha: 0.24),
                      ),
                    ),
                    child: const Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_rounded,
                          color: AppColors.gold,
                          size: 25,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'نصيحة: استخدم كلمات واضحة مرتبطة بالوظيفة، وركّز على الإنجازات والنتائج بدل وصف المهام فقط.',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 12,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeSlide(
                  delay: const Duration(milliseconds: 400),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _openPreview,
                      icon: const Icon(
                        Icons.visibility_rounded,
                      ),
                      label: const Text(
                        'معاينة السيرة الذاتية',
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 5,
                        shadowColor: AppColors.primary.withValues(
                          alpha: 0.25,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FadeSlide(
                  delay: const Duration(milliseconds: 450),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _analyzeCv,
                      icon: const Icon(
                        Icons.analytics_rounded,
                      ),
                      label: const Text(
                        'تحليل السيرة مع ATS',
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryDark,
                        side: const BorderSide(
                          color: AppColors.primaryDark,
                          width: 1.4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    'النسخة الأولية — سيتم تطوير التحليل والتصدير لاحقًا',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}

class CvPreviewPage extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String email;
  final String phone;
  final String location;
  final String summary;
  final String education;
  final String experience;
  final String skills;
  final String languages;

  const CvPreviewPage({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.location,
    required this.summary,
    required this.education,
    required this.experience,
    required this.skills,
    required this.languages,
  });

  Widget _section({
    required String title,
    required String value,
  }) {
    if (value.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: AppColors.primaryDark,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 2,
            width: 55,
            color: AppColors.gold,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 13,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactItems = [
      if (email.isNotEmpty) email,
      if (phone.isNotEmpty) phone,
      if (location.isNotEmpty) location,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      appBar: AppBar(
        title: const Text(
          'معاينة السيرة الذاتية',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 30),
          children: [
            FadeSlide(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 600,
                ),
                padding: const EdgeInsets.fromLTRB(27, 30, 27, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.isEmpty ? 'Your Name' : name,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      jobTitle.isEmpty
                          ? 'Professional Title'
                          : jobTitle,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (contactItems.isNotEmpty) ...[
                      const SizedBox(height: 13),
                      Wrap(
                        spacing: 14,
                        runSpacing: 6,
                        children: contactItems
                            .map(
                              (item) => Text(
                                item,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 10.5,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      height: 3,
                      width: double.infinity,
                      color: AppColors.primaryDark,
                    ),
                    _section(
                      title: 'Professional Summary',
                      value: summary,
                    ),
                    _section(
                      title: 'Experience',
                      value: experience,
                    ),
                    _section(
                      title: 'Education',
                      value: education,
                    ),
                    _section(
                      title: 'Skills',
                      value: skills,
                    ),
                    _section(
                      title: 'Languages',
                      value: languages,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'معاينة أولية — سيتم إضافة تصدير PDF لاحقًا',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
