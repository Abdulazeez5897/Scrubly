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
      backgroundColor: kcPrimaryBlue, // Background for the top section
      body: SafeArea(
        bottom: false, // Let the white container handle the bottom safe area
        child: Column(
          children: [
            // Top Section (Header) - takes up tight space but fills visually up to 30% via LayoutBuilder or flex
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo Area
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: kcWhiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.work_outline,
                        color: kcWhiteColor,
                        size: 28,
                      ),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Real People. Real Results.',
                      style: TextStyle(
                        fontSize: getResponsiveExtraLargeFontSize(context),
                        fontWeight: FontWeight.bold,
                        color: kcWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section (Form) - 70% of the screen
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kcFormBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: 40.0,
                    bottom: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome Text
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: getResponsiveMassiveFontSize(context),
                          fontWeight: FontWeight.bold,
                          color: kcTextDarkColor,
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
                        'Sign in to your account to continue',
                        style: TextStyle(
                          fontSize: getResponsiveSmallFontSize(context),
                          color: kcTextLightColor,
                        ),
                      ),
                      verticalSpaceLarge,

                      // Email Field
                      TextFieldWidget(
                        hint: 'Email Address *',
                        controller: viewModel.emailController,
                        inputType: TextInputType.emailAddress,
                        leading: const Icon(Icons.email_outlined, color: kcTextLightColor, size: 20),
                      ),
                      verticalSpaceMedium,

                      // Password Field
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

                      // Remember me and Forgot password
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
                                  fontSize: getResponsiveSmallFontSize(context),
                                  color: kcTextLightColor,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {}, // Implementation for future
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: kcPrimaryBlue,
                                fontSize: getResponsiveSmallFontSize(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,

                      // Sign In Button
                      SubmitButton(
                        isLoading: viewModel.isBusy,
                        label: 'Sign In',
                        buttonDisabled: !viewModel.canSignIn,
                        color: viewModel.canSignIn ? kcPrimaryBlue : kcButtonDisabledColor,
                        textColor: viewModel.canSignIn ? kcWhiteColor : kcButtonDisabledTextColor,
                        submit: viewModel.signIn,
                        borderRadius: 12.0,
                      ),
                      verticalSpaceLarge,

                      // SSL Encrypted Badge
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
                                  fontSize: getResponsiveSmallFontSize(context) * 0.9,
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
                          onTap: () {}, // Implementation for future
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: kcTextLightColor,
                                fontSize: getResponsiveSmallFontSize(context),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign up for free',
                                  style: TextStyle(
                                    color: kcPrimaryBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: getResponsiveSmallFontSize(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
