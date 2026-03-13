import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'specialist_onboarding_viewmodel.dart';

class SpecialistOnboardingView extends StackedView<SpecialistOnboardingViewModel> {
  const SpecialistOnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpecialistOnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: BoxDecoration(
          gradient: customOnboardingGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header section with graphic and text
              verticalSpaceLarge,
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kcWhiteColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: kcWhiteColor,
                  size: 32,
                ),
              ),
              verticalSpaceMedium,
              Text(
                'Welcome, Specialist!',
                style: TextStyle(
                  color: kcWhiteColor,
                  fontSize: getResponsiveExtraLargeFontSize(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Set up your security credentials and profile details to get started.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kcWhiteColor.withOpacity(0.9),
                    fontSize: getResponsiveSmallFontSize(context),
                  ),
                ),
              ),
              verticalSpaceLarge,

              // Bottom Sheet Form Container
              Expanded(
                child: Container(
                  width: screenWidth(context),
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  decoration: const BoxDecoration(
                    color: kcWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mock User Details Display
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kcOnboardingIconBgColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kcPrimaryBlue.withOpacity(0.1)),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: kcPrimaryBlue.withOpacity(0.2),
                                radius: 24,
                                child: Text(
                                  viewModel.mockUserName.substring(0, 1),
                                  style: const TextStyle(
                                    color: kcPrimaryBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              horizontalSpaceMedium,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewModel.mockUserName,
                                      style: TextStyle(
                                        color: kcBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getResponsiveMediumFontSize(context),
                                      ),
                                    ),
                                    Text(
                                      viewModel.mockUserEmail,
                                      style: TextStyle(
                                        color: kcTextLightColor,
                                        fontSize: getResponsiveSmallFontSize(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,

                        // Account Security Section
                        Text(
                          'Account Security',
                          style: TextStyle(
                            fontSize: getResponsiveMediumFontSize(context),
                            fontWeight: FontWeight.bold,
                            color: kcBlackColor,
                          ),
                        ),
                        verticalSpaceSmall,
                        TextFieldWidget(
                          hint: 'Password (min. 8 characters) *',
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
                        verticalSpaceMedium,
                        TextFieldWidget(
                          hint: 'Confirm Password *',
                          controller: viewModel.confirmPasswordController,
                          obscureText: !viewModel.isConfirmPasswordVisible,
                          leading: const Icon(Icons.lock_outline, color: kcTextLightColor, size: 20),
                          suffix: IconButton(
                            icon: Icon(
                              viewModel.isConfirmPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: kcTextLightColor,
                              size: 20,
                            ),
                            onPressed: viewModel.toggleConfirmPasswordVisibility,
                          ),
                        ),
                        verticalSpaceMedium,
                        const Divider(color: kcFormBorderColor),
                        verticalSpaceMedium,

                        // Professional Details Section
                        Text(
                          'Professional Details',
                          style: TextStyle(
                            fontSize: getResponsiveMediumFontSize(context),
                            fontWeight: FontWeight.bold,
                            color: kcBlackColor,
                          ),
                        ),
                        verticalSpaceSmall,
                        TextFieldWidget(
                          hint: 'Your Specialization (e.g., Tech Recruiter) *',
                          controller: viewModel.specializationController,
                          leading: const Icon(Icons.badge_outlined, color: kcTextLightColor, size: 20),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller: viewModel.bioController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kcWhiteColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: kcBlackColor.withOpacity(0.22)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: kcBlackColor.withOpacity(0.22)),
                            ),
                            hintText: 'Short Professional Bio *',
                            hintStyle: const TextStyle(color: kcTextLightColor, fontSize: 14),
                          ),
                        ),
                        verticalSpaceLarge,

                        // Submit Button
                        SubmitButton(
                          isLoading: viewModel.isBusy,
                          label: 'Complete Onboarding',
                          submit: viewModel.completeOnboarding,
                          buttonDisabled: !viewModel.canCompleteOnboarding,
                          color: viewModel.canCompleteOnboarding ? kcPrimaryBlue : kcButtonDisabledColor,
                          textColor: viewModel.canCompleteOnboarding ? kcWhiteColor : kcButtonDisabledTextColor,
                          borderRadius: 12.0,
                        ),
                        verticalSpaceLarge,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SpecialistOnboardingViewModel viewModelBuilder(BuildContext context) =>
      SpecialistOnboardingViewModel();
}
