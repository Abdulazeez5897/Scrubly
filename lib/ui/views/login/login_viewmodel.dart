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
      final role = await _authenticationService.loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (role != null) {
        // Clear history and navigate to Dashboard
        await _navigationService.clearStackAndShow(Routes.dashboardView);
      } else {
        await _dialogService.showDialog(
          title: 'Login Error',
          description: 'Login failed. Could not fetch user role.',
        );
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Login Error',
        description: e.toString().replaceAll('Exception: ', ''),
      );
    } finally {
      setBusy(false);
    }
  }
}
