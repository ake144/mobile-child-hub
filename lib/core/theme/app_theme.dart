import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors - Vibrant and child-friendly
  static const Color primaryColor = Color(0xFF6C63FF); // Purple
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color primaryDark = Color(0xFF4A42D9);

  // Secondary Colors
  static const Color secondaryColor = Color(0xFFFF6B6B); // Coral
  static const Color accentColor = Color(0xFF4ECDC4); // Teal

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FE);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF16213E);

  // Book Colors (for category cards)
  static const Color genesisColor = Color(0xFF6C63FF);
  static const Color exodusColor = Color(0xFFFF6B6B);
  static const Color leviticusColor = Color(0xFF4ECDC4);
  static const Color numbersColor = Color(0xFFFFE66D);

  // Gamification Colors
  static const Color goldColor = Color(0xFFFFD700);
  static const Color silverColor = Color(0xFFC0C0C0);
  static const Color bronzeColor = Color(0xFFCD7F32);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF2D3436);
  static const Color textSecondaryLight = Color(0xFF636E72);
  static const Color textPrimaryDark = Color(0xFFF5F6FA);
  static const Color textSecondaryDark = Color(0xFFB2BEC3);

  static SystemUiOverlayStyle systemUiOverlayStyleFor(Brightness brightness) {
    // Android uses `statusBarIconBrightness` for icon color.
    // iOS uses `statusBarBrightness` to infer icon color.
    final isDark = brightness == Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    );
  }

  static ThemeData lightTheme(String languageCode) {
    final isAmharic = languageCode == 'am';
    final fontFamily = isAmharic ? 'NotoSansEthiopic' : null;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceLight,
        error: errorColor,
      ),
      textTheme: isAmharic
          ? _buildAmharicTextTheme(Brightness.light)
          : _buildTextTheme(Brightness.light),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemUiOverlayStyleFor(Brightness.light),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimaryLight,
        ),
        iconTheme: const IconThemeData(color: textPrimaryLight),
      ),
      cardTheme: CardThemeData(
        color: surfaceLight,
        elevation: 4,
        shadowColor: primaryColor.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: primaryColor.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceLight,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondaryLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData darkTheme(String languageCode) {
    final isAmharic = languageCode == 'am';
    final fontFamily = isAmharic ? 'NotoSansEthiopic' : null;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: primaryLight,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceDark,
        error: errorColor,
      ),
      textTheme: isAmharic
          ? _buildAmharicTextTheme(Brightness.dark)
          : _buildTextTheme(Brightness.dark),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemUiOverlayStyleFor(Brightness.dark),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        iconTheme: const IconThemeData(color: textPrimaryDark),
      ),
      cardTheme: CardThemeData(
        color: surfaceDark,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryLight,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: primaryLight.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: primaryLight,
        unselectedItemColor: textSecondaryDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final color = brightness == Brightness.light
        ? textPrimaryLight
        : textPrimaryDark;

    return GoogleFonts.nunitoTextTheme().copyWith(
      displayLarge: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displaySmall: GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static TextTheme _buildAmharicTextTheme(Brightness brightness) {
    final color = brightness == Brightness.light
        ? textPrimaryLight
        : textPrimaryDark;

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displayMedium: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displaySmall: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.5,
      ),
      labelLarge: TextStyle(
        fontFamily: 'NotoSansEthiopic',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  // Gradient for special cards
  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [primaryColor, primaryLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get warmGradient => const LinearGradient(
        colors: [secondaryColor, Color(0xFFFFE66D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get coolGradient => const LinearGradient(
        colors: [accentColor, Color.fromARGB(255, 35, 90, 102)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // Get book color by name
  static Color getBookColor(String bookEn) {
    switch (bookEn.toLowerCase()) {
      case 'genesis':
        return genesisColor;
      case 'exodus':
        return exodusColor;
      case 'leviticus':
        return leviticusColor;
      case 'numbers':
        return numbersColor;
      default:
        return primaryColor;
    }
  }

  // Border radius constants
  static const double radiusSmall = 8;
  static const double radiusMedium = 16;
  static const double radiusLarge = 24;
  static const double radiusXLarge = 32;

  // Spacing constants
  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;
}
