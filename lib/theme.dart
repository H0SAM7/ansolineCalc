import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF2E7CEE);
  static const Color secondaryTeal = Color(0xFF00D4C7);
  static const Color accentGreen = Color(0xFF7ED321);
  static const Color warningOrange = Color(0xFFFF8A00);
  static const Color errorRed = Color(0xFFFF4757);
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E293B);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: lightBackground,
    useMaterial3: true,
    
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      secondary: secondaryTeal,
      surface: cardLight,
      background: lightBackground,
      error: errorRed,
    ),
    
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      color: cardLight,
      shadowColor: primaryBlue.withOpacity(0.1),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: primaryBlue.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryBlue,
        side: const BorderSide(color: primaryBlue, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      hintStyle: GoogleFonts.inter(color: Colors.grey.shade500),
      labelStyle: GoogleFonts.inter(color: Colors.grey.shade700),
    ),
    
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32, 
        fontWeight: FontWeight.bold, 
        color: Colors.grey.shade900,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28, 
        fontWeight: FontWeight.bold, 
        color: Colors.grey.shade900,
        height: 1.2,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24, 
        fontWeight: FontWeight.w700, 
        color: Colors.grey.shade900,
        height: 1.3,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20, 
        fontWeight: FontWeight.w600, 
        color: Colors.grey.shade900,
        height: 1.3,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, 
        fontWeight: FontWeight.w500, 
        color: Colors.grey.shade800,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, 
        color: Colors.grey.shade600,
        height: 1.4,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12, 
        color: Colors.grey.shade500,
        height: 1.4,
      ),
    ),
    
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade900,
      ),
      iconTheme: IconThemeData(color: Colors.grey.shade900),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: darkBackground,
    useMaterial3: true,
    
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: secondaryTeal,
      surface: cardDark,
      background: darkBackground,
      error: errorRed,
    ),
    
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade800, width: 1),
      ),
      color: cardDark,
      shadowColor: primaryBlue.withOpacity(0.2),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: primaryBlue.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryBlue,
        side: const BorderSide(color: primaryBlue, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      hintStyle: GoogleFonts.inter(color: Colors.grey.shade400),
      labelStyle: GoogleFonts.inter(color: Colors.grey.shade300),
    ),
    
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32, 
        fontWeight: FontWeight.bold, 
        color: Colors.white,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28, 
        fontWeight: FontWeight.bold, 
        color: Colors.white,
        height: 1.2,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24, 
        fontWeight: FontWeight.w700, 
        color: Colors.white,
        height: 1.3,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20, 
        fontWeight: FontWeight.w600, 
        color: Colors.white,
        height: 1.3,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16, 
        fontWeight: FontWeight.w500, 
        color: Colors.grey.shade200,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, 
        color: Colors.grey.shade300,
        height: 1.4,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12, 
        color: Colors.grey.shade400,
        height: 1.4,
      ),
    ),
    
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  );

  // Arabic Theme with Cairo font
  static ThemeData getArabicTheme(ThemeData baseTheme, bool isLight) {
    final textColor = isLight ? Colors.grey.shade900 : Colors.white;
    final bodyColor = isLight ? Colors.grey.shade800 : Colors.grey.shade200;
    final bodyMediumColor = isLight ? Colors.grey.shade600 : Colors.grey.shade300;
    final bodySmallColor = isLight ? Colors.grey.shade500 : Colors.grey.shade400;
    
    return baseTheme.copyWith(
      // Use Cairo font for Arabic text
      textTheme: GoogleFonts.cairoTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: GoogleFonts.cairo(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.3, // Better line height for Arabic
        ),
        displayMedium: GoogleFonts.cairo(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.3,
        ),
        headlineLarge: GoogleFonts.cairo(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textColor,
          height: 1.4,
        ),
        headlineMedium: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.cairo(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: bodyColor,
          height: 1.6, // Better readability for Arabic
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 14,
          color: bodyMediumColor,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.cairo(
          fontSize: 12,
          color: bodySmallColor,
          height: 1.5,
        ),
      ),
      
      // Update button themes for Arabic
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: baseTheme.elevatedButtonTheme.style?.copyWith(
          textStyle: MaterialStateProperty.all(
            GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: baseTheme.outlinedButtonTheme.style?.copyWith(
          textStyle: MaterialStateProperty.all(
            GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      
      // Update input decoration for Arabic
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        hintStyle: GoogleFonts.cairo(
          color: isLight ? Colors.grey.shade500 : Colors.grey.shade400,
        ),
        labelStyle: GoogleFonts.cairo(
          color: isLight ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
      ),
      
      // Update app bar theme for Arabic
      appBarTheme: baseTheme.appBarTheme.copyWith(
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  // Helper method to get text style based on language
  static TextStyle getTextStyle({
    required bool isArabic,
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    if (isArabic) {
      return GoogleFonts.cairo(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height ?? 1.5,
      );
    } else {
      return GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height ?? 1.4,
      );
    }
  }

  // Helper method for getting heading style
  static TextStyle getHeadingStyle({
    required bool isArabic,
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return getTextStyle(
      isArabic: isArabic,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color,
      height: isArabic ? 1.4 : 1.3,
    );
  }

  // Helper method for getting body style
  static TextStyle getBodyStyle({
    required bool isArabic,
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return getTextStyle(
      isArabic: isArabic,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color,
      height: isArabic ? 1.6 : 1.5,
    );
  }
}