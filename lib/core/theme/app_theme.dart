import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppTheme {
  // calculates sizes at runtime, not at app boot,
  // while avoiding redundant rebuilds.
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);
  static ThemeData get lightTheme => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      textTheme: _buildTextTheme(brightness),
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: const Color(0xFF97004C),
        // Surface: The background of cards, sheets, and menus
        surface: isDark ? const Color(0xFF451D4A) : const Color(0xFFF7EDF8),
        // OnSurface: The color of text/icons sitting on the surface
        onSurface: isDark ? const Color(0xFFA599B0) : const Color(0xFF632A69),
        // Primary container and its content
        primary: isDark ? const Color(0xFFFF5CAE) : const Color(0xFF632A69),
        onPrimary: isDark ? Colors.black : Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark
            ? const Color(0xFF451D4A)
            : const Color(0xFFF7EDF8),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 24.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : const Color(0xFF27112A),
        ),
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : const Color(0xFF171A1F),
          size: 24.sp,
        ),
        foregroundColor: isDark ? Colors.white : const Color(0xFF171A1F),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: isDark
              ? const Color(0xFFFF5CAE)
              : const Color(0xFF632A69),
          iconSize: 24.sp,
          padding: EdgeInsets.all(8.w),
          hoverColor: const Color(0xFFFDBCDE),
          highlightColor: const Color(0xFFFDBCDE),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(358.w, 40.h),
          maximumSize: Size(358.w, 50.h),

          backgroundColor: isDark
              ? Color(0xFFFF5CAE)
              : Color(0xFF632A69), // button background
          foregroundColor: isDark
              ? Color(0xFF27112A)
              : Colors.white, // text/icon color
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato',
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          elevation: 6.h,
          shadowColor: Colors.black.withValues(alpha: 0.25),
          iconSize: 24.w,
          iconColor: isDark ? const Color(0xFFE0BBE4) : Colors.white,
          alignment: Alignment.center, // keeps icon+text aligned
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isDark
            ? const Color(0xFFFF5CAE)
            : const Color(0xFF632A69),
        foregroundColor: isDark ? Colors.black : const Color(0xFFE0BBE4),
        hoverColor: isDark ? const Color(0xFFFDBCDE) : const Color(0xFF9F43A9),
        splashColor: isDark ? const Color(0xFFFDBCDE) : const Color(0xFF9F43A9),
        iconSize: 24.sp,
        shape: const CircleBorder(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Color(0xff9F9F9F),
        floatingLabelAlignment: .start,
        filled: true,
        fillColor: isDark
            ? Color(0xFF27112A).withValues(alpha: 0.5)
            : Colors.white,
        hintStyle: const TextStyle(color: Color(0xff9F9F9F)),
        labelStyle: const TextStyle(color: Color(0xff9F9F9F)),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: isDark
              ? BorderSide.none
              : const BorderSide(color: Color(0xff9F9F9F)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xff9F9F9F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xff9F9F9F)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      // Scaffolds need to know their default background color
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF451D4A)
          : const Color(0xFFF7EDF8),
      extensions: [
        SmoothPageIndicatorTheme(
          effect: ExpandingDotsEffect(
            dotWidth: 10.w,
            dotHeight: 10.w,
            spacing: 6.w,
            radius: 16.r,
          ), // default effect when none is specified
          defaultColors: DefaultIndicatorColors(
            active: isDark ? Color(0xFFFDBCDE) : Color(0xFF451D4A),
            inactive: isDark ? Colors.white : Color(0XFFE6C8E9),
          ),
        ),
      ],
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    final Color primaryTextColor = isDark
        ? Colors.white
        : const Color(0xFF632A69);
    final Color secondaryTextColor = isDark
        ? const Color(0xFFA599B0)
        : const Color(0xFF171A1F);

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Lato',
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: secondaryTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Lato',
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: secondaryTextColor,
      ),
    );
  }
}
