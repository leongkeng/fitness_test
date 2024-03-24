import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/routes/app_routes.dart';
import 'package:fitness_app/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  //Usually the initial route would be the SplashScreen
  String get initialRoute {
    return AppRoutes.challengePage;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: navigatorKey,
        theme: _getTheme(),
        getPages: AppPage.routes,
        initialRoute: initialRoute,
        // Support different languages
        // locale: Get.find<LanguageController>().appLocale,
        debugShowCheckedModeBanner: false,
      );
  }

  /// Apps theme
  ThemeData _getTheme({bool isDarkMode = false}) {
    return ThemeData(
      primaryColor: Colours.primary,
      primaryColorDark: Colours.primaryDark,
      iconTheme: const IconThemeData(color: Colors.white),
      highlightColor: const Color.fromRGBO(255, 255, 255, .05),
      splashColor: Colors.transparent,
      bottomAppBarTheme: const BottomAppBarTheme(color: Colours.colorTabBar),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          titleTextStyle: GoogleFonts.inter(
              fontSize: 16.0,
              color: isDarkMode ? Colours.colorNormalText : Colors.white,
              fontWeight: FontWeight.w700)),
      dialogBackgroundColor: Colours.colorTagBg,
      scaffoldBackgroundColor: isDarkMode ? Colours.scaffoldDarkBg : Colours.scaffoldBg,
      useMaterial3: false,
      textTheme: TextTheme(
        titleSmall: isDarkMode
            ? const TextStyle(fontSize: 14, color: Colors.white)
            : const TextStyle(fontSize: 14, color: Colors.black),
        titleMedium: isDarkMode
            ? const TextStyle(fontSize: 14, color: Colors.white)
            : const TextStyle(fontSize: 14, color: Colors.black),
        bodySmall: isDarkMode
            ? const TextStyle(color: Color(0xFF888888), fontSize: 16.0)
            : const TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        bodyMedium: isDarkMode
            ? const TextStyle(color: Color(0xffcccccc), fontSize: 14.0)
            : const TextStyle(color: Colors.black54, fontSize: 14.0),
        bodyLarge: isDarkMode
            ? const TextStyle(color: Color(0xffcccccc), fontSize: 14.0)
            : const TextStyle(color: Colors.white, fontSize: 14.0),
        // regular
        displaySmall: GoogleFonts.inter(
            fontSize: 14,
            color: !isDarkMode ? Colors.white : Colours.colorNormalText,
            fontWeight: FontWeight.w400),
        // medium
        displayMedium: GoogleFonts.inter(
            fontSize: 14,
            color: !isDarkMode ? Colors.white : Colours.colorNormalText,
            fontWeight: FontWeight.w500),
        // bold
        displayLarge: GoogleFonts.inter(
            fontSize: 14,
            color: !isDarkMode ? Colors.white : Colours.colorNormalText,
            fontWeight: FontWeight.w700),
        // light
        headlineSmall: GoogleFonts.inter(
            fontSize: 14,
            color: !isDarkMode ? Colors.white : Colours.colorNormalText,
            fontWeight: FontWeight.w300),
        // black
        headlineLarge: GoogleFonts.inter(
            fontSize: 14,
            color: !isDarkMode ? Colors.white : Colours.colorNormalText,
            fontWeight: FontWeight.w900),
        labelSmall: GoogleFonts.inter(
          color: !isDarkMode ? Colors.white : Colours.colorNormalText,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.white,
      ),
      dividerColor: Colours.grey,
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
        error: Colours.red,
        primary: Colours.primary,
        secondary: Colours.primary,
      )
          : const ColorScheme.light(
        error: Colours.red,
        primary: Colours.primary,
        secondary: Colours.primary,
      ),
    );
  }
}
