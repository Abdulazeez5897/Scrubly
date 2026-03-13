import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../app/app.router.dart';

class SpecialistOnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Mock Details
  final String mockUserName = "Abdulazeez Usman";
  final String mockUserEmail = "usmanabdulazeez589@gmail.com";

  // Text Controllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  SpecialistOnboardingViewModel() {
    passwordController.addListener(notifyListeners);
    confirmPasswordController.addListener(notifyListeners);
    bioController.addListener(notifyListeners);
    specializationController.addListener(notifyListeners);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    bioController.dispose();
    specializationController.dispose();
    super.dispose();
  }

  // Validation
  bool get canCompleteOnboarding {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final bio = bioController.text.trim();
    final specialization = specializationController.text.trim();

    final hasValidPasswords = password.isNotEmpty && 
                              password.length >= 8 && 
                              password == confirmPassword;
    
    final hasMetrics = bio.isNotEmpty && specialization.isNotEmpty;

    return hasValidPasswords && hasMetrics;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    if (!canCompleteOnboarding) return;

    setBusy(true);
    
    // Mock network delay
    await Future.delayed(const Duration(seconds: 2));

    setBusy(false);

    // Navigate to placeholder dashboard View
    await _navigationService.clearStackAndShow(Routes.dashboardView);
  }
}
