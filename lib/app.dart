import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrapkart_web/main.dart' show LandingPage;
import 'pages/landing_page.dart';
import 'core/app_colors.dart';

class ScrapkartApp extends StatelessWidget {
  const ScrapkartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.interTextTheme();

    return MaterialApp(
      title: 'Scrapkart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
          primary: AppColors.kBlue,
          secondary: AppColors.kGreen,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
        ),
        textTheme: textTheme,
        useMaterial3: true,
      ),
      // home: const LandingPage(),
    );
  }
}
