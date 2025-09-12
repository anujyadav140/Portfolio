import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MinimalistTheme {
  static const Color primaryBlack = Color(0xFF0A0A0A);
  static const Color primaryWhite = Color(0xFFFAFAFA);
  static const Color accentGray = Color(0xFF2D2D2D);
  static const Color lightGray = Color(0xFF666666);
  static const Color borderGray = Color(0xFF1A1A1A);
  static const Color hoverGray = Color(0xFF404040);
  
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryBlack,
    primaryColor: primaryWhite,
    
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.w300,
        color: primaryWhite,
        letterSpacing: -2,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w300,
        color: primaryWhite,
        letterSpacing: -1,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: primaryWhite,
        letterSpacing: -0.5,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: primaryWhite,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: lightGray,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: lightGray,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryWhite,
        letterSpacing: 0.5,
      ),
    ),
    
    colorScheme: const ColorScheme.dark(
      primary: primaryWhite,
      secondary: accentGray,
      surface: primaryBlack,
      onPrimary: primaryBlack,
      onSecondary: primaryWhite,
      onSurface: primaryWhite,
    ),
  );
}