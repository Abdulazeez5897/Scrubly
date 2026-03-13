import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF336699);
const Color kcPrimaryColorDark = Color(0xFF2D395A);
const Color kcFadeColor = Color.fromRGBO(14, 41, 84, 0.1);
const Color kcSecondaryColor = Color(0xFFCC9933);
const Color kcStarColor = Color(0xFFFDCC0D);
const Color kcOrangeColor = Color(0xFFFFB000);
const Color kcWhiteColor = Color(0xFFFFFFFF);
const Color kcBlackColor = Color(0xFF000000);
const Color kcDarkGreyColor = Color(0xFF1A1B1E);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color(0xFFFAFAFA);
const Color kcOrange = Color(0xFFDD6700);
const Color kcBackgroundColor = Color(0xFFFFF3DB);

// Auth UI Colors
const Color kcPrimaryBlue = Color(0xFF2563EB); // Web design primary blue
const Color kcFormBackgroundColor = Color(0xFFFFFFFF);
const Color kcFormBorderColor = Color(0xFFE5E7EB);
const Color kcTextLightColor = Color(0xFF6B7280);
const Color kcTextDarkColor = Color(0xFF111827);
const Color kcSuccessGreen = Color(0xFF10B981);
const Color kcSuccessGreenLight = Color(0xFFD1FAE5);
const Color kcButtonDisabledColor = Color(0xFFE5E7EB);
const Color kcButtonDisabledTextColor = Color(0xFF9CA3AF);

// Specialist Onboarding Colors
const Color kcOnboardingGradientStart = Color(0xFF6366F1); // Soft Purple
const Color kcOnboardingGradientEnd = Color(0xFF3B82F6);   // Soft Blue
const Color kcOnboardingSurfaceColor = Color(0xFFFFFFFF);
const Color kcOnboardingIconBgColor = Color(0xFFEEF2FF);

LinearGradient customOnboardingGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    kcOnboardingGradientStart,
    kcOnboardingGradientEnd,
  ],
);
