import 'package:calculator/about_screen.dart';
import 'package:calculator/generated/l10n.dart';
import 'package:calculator/language_service.dart';
import 'package:calculator/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../models/settings.dart';

class CalculatorScreen extends StatefulWidget {
  final Settings settings;

  const CalculatorScreen({super.key, required this.settings});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _glucoseController = TextEditingController();
  final _carbsController = TextEditingController();
  
  double? _calculatedDose;
  bool _isCalculating = false;

  @override
  void dispose() {
    _glucoseController.dispose();
    _carbsController.dispose();
    super.dispose();
  }

  void _calculateDose() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isCalculating = true);
      
      // Add haptic feedback
      HapticFeedback.mediumImpact();
      
      // Simulate calculation delay for smooth animation
      await Future.delayed(const Duration(milliseconds: 600));
      
      final glucose = double.parse(_glucoseController.text);
      final carbs = double.parse(_carbsController.text);
      
      // Formula: ((BloodGlucose - 100) / ISF) + (Carbs / CarbRatio)
      final correctionDose = (glucose - 100) / widget.settings.insulinSensitivityFactor;
      final carbDose = carbs / widget.settings.carbohydrateRatio;
      final totalDose = correctionDose + carbDose;
      
      setState(() {
        _calculatedDose = totalDose > 0 ? totalDose : 0;
        _isCalculating = false;
      });
    }
  }

  void _clearFields() {
    _glucoseController.clear();
    _carbsController.clear();
    setState(() {
      _calculatedDose = null;
    });
    HapticFeedback.lightImpact();
  }

  Color _getDoseColor(double dose) {
    if (dose < 2) return const Color(0xFF7ED321);
    if (dose < 5) return const Color(0xFFFF8A00);
    return const Color(0xFFFF4757);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final languageService = Provider.of<LanguageService>(context);
    
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Row(
                  children: [
                    Container(
          
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: 
                      DropdownButtonHideUnderline(

                        child: DropdownButton<String>(
                          
                          value: languageService.locale.languageCode,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          borderRadius: BorderRadius.circular(12.r),
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text('🇺🇸', style: TextStyle(fontSize: 16.sp)),
                            ),
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text('🇸🇦', style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              languageService.changeLanguage(value);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        l10n.appTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    // Language Selector
                   
                    SizedBox(width: 8.w),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetupScreen(),
                          ),
                        );
                      },
                      icon: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.settings_rounded,
                          color: const Color(0xFF2E7CEE),
                          size: 20.sp,
                        ),
                      ),
                    ),
                          const SizedBox(width: 8),
      // About Button
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AboutScreen(),
            ),
          );
        },
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.info_outline_rounded,
          color: const Color(0xFF2E7CEE),          ),
        ),
      ),

                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Blood Glucose Card
                        CustomCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF4757).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Icon(
                                      Icons.bloodtype_rounded,
                                      color: const Color(0xFFFF4757),
                                      size: 24.sp,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Text(
                                      l10n.currentBloodGlucose,
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              TextFormField(
                                controller: _glucoseController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  hintText: l10n.glucoseHint,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  suffixText: l10n.glucoseUnit,
                                  suffixStyle: TextStyle(fontSize: 14.sp),
                                  prefixIcon: Icon(Icons.monitor_heart_outlined, size: 20.sp),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return l10n.pleaseEnterGlucose;
                                  }
                                  final glucose = double.tryParse(value!);
                                  if (glucose == null) {
                                    return l10n.enterValidNumber;
                                  }
                                  if (glucose < 40 || glucose > 600) {
                                    return l10n.realisticGlucose;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 100.ms).slideX(begin: 0.3, end: 0),
                        
                        SizedBox(height: 20.h),
                        
                        // Carbohydrates Card
                        CustomCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7ED321).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Icon(
                                      Icons.restaurant_rounded,
                                      color: const Color(0xFF7ED321),
                                      size: 24.sp,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Text(
                                      l10n.carbohydratesIntake,
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              TextFormField(
                                controller: _carbsController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  hintText: l10n.carbsHint,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  suffixText: l10n.carbsUnit,
                                  suffixStyle: TextStyle(fontSize: 14.sp),
                                  prefixIcon: Icon(Icons.grain_rounded, size: 20.sp),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return l10n.pleaseEnterCarbs;
                                  }
                                  final carbs = double.tryParse(value!);
                                  if (carbs == null) {
                                    return l10n.enterValidNumber;
                                  }
                                  if (carbs < 0 || carbs > 500) {
                                    return l10n.realisticCarbs;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.3, end: 0),
                        
                        SizedBox(height: 32.h),
                        
                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: AnimatedButton(
                                onPressed: _isCalculating ? null : _calculateDose,
                                isLoading: _isCalculating,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calculate_rounded, size: 20.sp),
                                    SizedBox(width: 8.w),
                                    Text(l10n.calculateDose, style: TextStyle(fontSize: 16.sp)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: Colors.grey.shade300, width: 2.w),
                              ),
                              child: IconButton(
                                onPressed: _clearFields,
                                icon: Icon(Icons.clear_rounded, size: 20.sp),
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.all(18.w),
                                  foregroundColor: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.3, end: 0),
                        
                        SizedBox(height: 32.h),
                        
                        // Result Card
                        if (_calculatedDose != null)
                          DoseResultCard(
                            dose: _calculatedDose!,
                            doseColor: _getDoseColor(_calculatedDose!),
                            units: l10n.units,
                            title: l10n.recommendedDose,
                            warningText: l10n.safetyWarning,
                          ).animate()
                            .scale(duration: 600.ms, curve: Curves.elasticOut)
                            .fadeIn(duration: 400.ms),
                        
                        SizedBox(height: 24.h),
                        
                        // Safety Information Card
                        CustomCard(
                          backgroundColor: const Color(0xFFFF8A00).withOpacity(0.1),
                          borderColor: const Color(0xFFFF8A00).withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: const Color(0xFFFF8A00),
                                    size: 28.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      l10n.safetyInfo,
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFFFF8A00),
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                l10n.safetyText,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.6,
                                  color: Colors.grey.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 700.ms),
                        
                        SizedBox(height: 32.h),
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

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E7CEE),
            Color(0xFF00D4C7),
            Color(0xFF7ED321),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: child,
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;

  const CustomCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: borderColor != null 
          ? Border.all(color: borderColor!, width: 1.w)
          : Border.all(color: Colors.grey.shade200, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
              ],
    ),
    child: child,
  );
}
}

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isLoading
                  ? [Colors.grey.shade400, Colors.grey.shade500]
                  : [
                      widget.backgroundColor ?? const Color(0xFF2E7CEE),
                      widget.backgroundColor?.withOpacity(0.8) ?? const Color(0xFF00D4C7),
                    ],
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: (widget.backgroundColor ?? const Color(0xFF2E7CEE)).withOpacity(0.3),
                blurRadius: 15.r,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: widget.foregroundColor ?? Colors.white,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: widget.isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : widget.child,
          ),
        ),
      ),
    );
  }
}

class DoseResultCard extends StatelessWidget {
  final double dose;
  final Color doseColor;
  final String units;
  final String title;
  final String warningText;

  const DoseResultCard({
    super.key,
    required this.dose,
    required this.doseColor,
    required this.units,
    required this.title,
    required this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: doseColor.withOpacity(0.05),
      borderColor: doseColor.withOpacity(0.3),
      child: Column(
        children: [
          // Animated Icon
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: doseColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: doseColor.withOpacity(0.3), width: 2.w),
            ),
            child: Icon(
              Icons.medication_rounded,
              size: 40.sp,
              color: doseColor,
            ),
          ).animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 2000.ms, color: doseColor.withOpacity(0.3))
            .animate()
            .scale(duration: 300.ms, curve: Curves.elasticOut),
          
          SizedBox(height: 24.h),
          
          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 16.h),
          
          // Dose Value
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: doseColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dose.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: doseColor,
                    height: 1,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  units,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: doseColor,
                  ),
                ),
              ],
            ),
          ).animate()
            .scale(delay: 200.ms, duration: 400.ms, curve: Curves.elasticOut)
            .fadeIn(delay: 200.ms),
          
          SizedBox(height: 24.h),
          
          // Warning
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    warningText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}