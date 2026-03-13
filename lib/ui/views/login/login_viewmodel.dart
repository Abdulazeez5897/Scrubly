import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool rememberMe = false;

  LoginViewModel() {
    emailController.addListener(notifyListeners);
    passwordController.addListener(notifyListeners);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get canSignIn {
    return emailController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe = value;
      notifyListeners();
    }
  }

  Future<void> signIn() async {
    if (!canSignIn) return;

    setBusy(true);

    try {
      // Mocking a 2-second delay for the sign in process
      await Future.delayed(const Duration(seconds: 2));

      // After delay, clear stack and navigate to the dashboard
      await _navigationService.clearStackAndShow(Routes.dashboardView);
    } catch (e) {
      // In a real app we'd show an error dialog here
      debugPrint("Login failed: $e");
    } finally {
      setBusy(false);
    }
  }
}
