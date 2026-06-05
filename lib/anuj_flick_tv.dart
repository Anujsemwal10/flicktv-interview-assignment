import 'package:anujsemwal/core/constants/colors.dart';
import 'package:anujsemwal/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';

class AnujFlickTv extends StatelessWidget {
  const AnujFlickTv({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundGradientStart,
      ),
      home: const OnboardingScreen(),
    );
  }
}
