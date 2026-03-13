import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/text_field_widget.dart';
import '../../components/submit_button.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Area
                const Icon(
                  Icons.business_center,
                  color: kcPrimaryBlue, // Added to ensure visibility against white
                  size: 48,
                ),
                verticalSpaceSmall,
                Text(
                  '247 Job Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kcTextDarkColor,
                  ),
                ),
                verticalSpaceLarge,
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kcTextDarkColor,
                  ),
                ),
                verticalSpaceTiny,
                Text(
                  'Sign in to your account to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: kcTextLightColor,
                  ),
                ),
                verticalSpaceLarge,

                // Input Fields
                TextFieldWidget(
                  hint: 'Email Address *',
                  controller: viewModel.emailController,
                  inputType: TextInputType.emailAddress,
                  leading: const Icon(Icons.email_outlined, color: kcTextLightColor, size: 20),
                ),
                verticalSpaceMedium,
                TextFieldWidget(
                  hint: 'Password *',
                  controller: viewModel.passwordController,
                  obscureText: !viewModel.isPasswordVisible,
                  leading: const Icon(Icons.lock_outline, color: kcTextLightColor, size: 20),
                  suffix: IconButton(
                    icon: Icon(
                      viewModel.isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: kcTextLightColor,
                      size: 20,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
                verticalSpaceSmall,

                // Options Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: viewModel.rememberMe,
                            onChanged: viewModel.toggleRememberMe,
                            activeColor: kcPrimaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 14,
                            color: kcTextLightColor,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {}, // For future implementation
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerRight,
                      ),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: kcPrimaryBlue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceLarge,

                // Sign In Action
                SubmitButton(
                  isLoading: viewModel.isBusy,
                  label: 'Sign In',
                  buttonDisabled: !viewModel.canSignIn,
                  color: viewModel.canSignIn ? kcPrimaryBlue : kcButtonDisabledColor,
                  textColor: viewModel.canSignIn ? Colors.white : kcButtonDisabledTextColor,
                  submit: viewModel.signIn,
                  borderRadius: 12.0,
                ),
                verticalSpaceMedium,

                // Security Badge
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: kcSuccessGreenLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kcSuccessGreen, width: 0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock_outline, color: kcSuccessGreen, size: 14),
                        horizontalSpaceTiny,
                        Text(
                          '256-bit SSL encrypted',
                          style: TextStyle(
                            color: kcSuccessGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpaceLarge,

                // Sign up prompt
                Center(
                  child: GestureDetector(
                    onTap: () {}, // For future implementation
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: kcTextLightColor,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up for free',
                            style: TextStyle(
                              color: kcPrimaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceLarge,
                
                // Footer Copyright
                Center(
                  child: Text(
                    '© 2026 247 Job Center. All rights reserved.',
                    style: TextStyle(
                      fontSize: 10,
                      color: kcTextLightColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
