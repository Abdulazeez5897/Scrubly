import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'startup/startup_viewmodel.dart';
import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcPrimaryBlue, // Using the primary brand color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Basic Fade-in & Scale Animation
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.5, end: 1.0),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.elasticOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: Transform.scale(
                    scale: value,
                    child: child,
                  ),
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kcWhiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.work_outline,
                  color: kcWhiteColor,
                  size: 48,
                ),
              ),
            ),
            verticalSpaceMedium,
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeIn,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Text(
                '247 Job Center',
                style: TextStyle(
                  fontSize: getResponsiveMassiveFontSize(context),
                  fontWeight: FontWeight.w800,
                  color: kcWhiteColor,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => viewModel.runStartupLogic();
}
