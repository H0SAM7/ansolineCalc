import 'package:calculator/calculator_screen.dart';
import 'package:calculator/generated/l10n.dart';
import 'package:calculator/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final languageService = Provider.of<LanguageService>(context);
    final isArabic = languageService.isArabic;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          isArabic 
                            ? Icons.arrow_forward_rounded
                            : Icons.arrow_back_rounded,
                          color: const Color(0xFF2E7CEE),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        l10n.aboutApp,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // App Info Card
                      CustomCard(
                        child: Column(
                          children: [
                            // App Icon
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF2E7CEE), Color(0xFF00D4C7)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF2E7CEE).withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.medical_services_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ).animate().scale(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.elasticOut,
                            ),
                            
                            const SizedBox(height: 24),
                            
                            Text(
                              l10n.appTitle,
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2E7CEE),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 8),
                            
                            Text(
                              l10n.appSubtitle,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 16),
                            
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7ED321).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'v1.0.0',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xFF7ED321),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3, end: 0),
                      
                      const SizedBox(height: 24),
                      
                      // Developers Section
                      CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2E7CEE).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.groups_rounded,
                                    color: Color(0xFF2E7CEE),
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    l10n.developedBy,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 24),
                            
                            // Doctor 1
                            _buildDoctorCard(
                              context: context,
                              name: isArabic ? 'د. علي المتحمي' : 'Dr. Ali Almathammi',
                              title: isArabic ? 'استشاري الغدد الصماء والسكري' : 'Endocrinology & Diabetes Consultant',
                              specialization: isArabic ? 'طب الغدد الصماء والسكري' : 'Endocrinology & Diabetes Medicine',
                              icon: Icons.local_hospital_rounded,
                              color: const Color(0xFF2E7CEE),
                              isArabic: isArabic,
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Doctor 2
                            _buildDoctorCard(
                              context: context,
                              name: isArabic ? 'د. فيصل الزهراني' : 'Dr. Faisal Al-Zahrani',
                              title: isArabic ? 'استشاري الغدد الصماء والسكري' : 'Endocrinology & Diabetes Consultant',
                              specialization: isArabic ? 'طب الغدد الصماء والسكري' : 'Endocrinology & Diabetes Medicine',
                              icon: Icons.medical_services_rounded,
                              color: const Color(0xFF00D4C7),
                              isArabic: isArabic,
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.3, end: 0),
                      
                      const SizedBox(height: 24),
                      
                      // Features Card
                      CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7ED321).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFF7ED321),
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    l10n.appFeatures,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 20),
                            
                            _buildFeatureItem(
                              context: context,
                              icon: Icons.calculate_rounded,
                              title: l10n.feature1Title,
                              description: l10n.feature1Description,
                            ),
                            
                            const SizedBox(height: 16),
                            
                            _buildFeatureItem(
                              context: context,
                              icon: Icons.language_rounded,
                              title: l10n.feature2Title,
                              description: l10n.feature2Description,
                            ),
                            
                            const SizedBox(height: 16),
                            
                            _buildFeatureItem(
                              context: context,
                              icon: Icons.security_rounded,
                              title: l10n.feature3Title,
                              description: l10n.feature3Description,
                            ),
                            
                            const SizedBox(height: 16),
                            
                            _buildFeatureItem(
                              context: context,
                              icon: Icons.design_services_rounded,
                              title: l10n.feature4Title,
                              description: l10n.feature4Description,
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.3, end: 0),
                      
                      const SizedBox(height: 24),
                      
                      // Disclaimer Card
                      CustomCard(
                        backgroundColor: const Color(0xFFFF8A00).withOpacity(0.1),
                        borderColor: const Color(0xFFFF8A00).withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Color(0xFFFF8A00),
                                  size: 28,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    l10n.medicalDisclaimer,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF8A00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              l10n.disclaimerText,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.6,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 800.ms),
                      
                      const SizedBox(height: 24),
                      
                      // // Contact Card
                      // CustomCard(
                      //   backgroundColor: Colors.blue.withOpacity(0.05),
                      //   borderColor: Colors.blue.withOpacity(0.3),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           const Icon(
                      //             Icons.contact_support_rounded,
                      //             color: Colors.blue,
                      //             size: 28,
                      //           ),
                      //           const SizedBox(width: 12),
                      //           Expanded(
                      //             child: Text(
                      //               l10n.contactUs,
                      //               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.blue,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       const SizedBox(height: 16),
                      //       Text(
                      //         l10n.contactText,
                      //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      //           height: 1.6,
                      //           color: Colors.grey.shade700,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 16),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           _buildContactButton(
                      //             icon: Icons.email_rounded,
                      //             label: l10n.email,
                      //             onTap: () => _launchEmail(),
                      //           ),
                      //           _buildContactButton(
                      //             icon: Icons.phone_rounded,
                      //             label: l10n.phone,
                      //             onTap: () => _launchPhone(),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ).animate().fadeIn(delay: 1000.ms),
                      
                      const SizedBox(height: 32),
                      
                      // Copyright
                      Text(
                        '© 2024 ${l10n.appTitle}. ${l10n.allRightsReserved}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 1200.ms),
                      
                      const SizedBox(height: 32),
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

  Widget _buildDoctorCard({
    required BuildContext context,
    required String name,
    required String title,
    required String specialization,
    required IconData icon,
    required Color color,
    required bool isArabic,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                // const SizedBox(height: 4),
                // Text(
                //   title,
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                const SizedBox(height: 2),
                // Text(
                //   specialization,
                //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF7ED321).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF7ED321),
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.blue, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@insulincalculator.com',
      query: 'subject=Insulin Calculator Support',
    );
    
    try {
      await launchUrl(emailUri);
    } catch (e) {
      // If email app is not available, copy email to clipboard
      Clipboard.setData(const ClipboardData(text: 'support@insulincalculator.com'));
    }
  }

  void _launchPhone() async {
    const String phoneNumber = '+966501234567';
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    
    try {
      await launchUrl(phoneUri);
    } catch (e) {
      // If phone app is not available, copy number to clipboard
      Clipboard.setData(const ClipboardData(text: phoneNumber));
    }
  }
}