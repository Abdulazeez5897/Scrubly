import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4AD3), // Rich blue background
      body: Stack(
        children: [
          // Animated Background Circles
          const Positioned.fill(
            child: _AnimatedBackgroundGeometry(),
          ),
          
          SafeArea(
            child: Column(
              children: [
                verticalSpaceLarge,
                // Logo Icon
                const Icon(
                  Icons.business_center,
                  color: Colors.white,
                  size: 48,
                ),
                verticalSpaceMedium,
                
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Real People. Real Results.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                verticalSpaceMedium,
                
                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "Join thousands of job seekers who trust real human specialists to handle their job applications professionally.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                  ),
                ),
                verticalSpaceLarge,
                
                // Stats Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _GlassCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10,000+",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              verticalSpaceTiny,
                              Text(
                                "Applications Submitted",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      Expanded(
                        child: _GlassCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "95%",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              verticalSpaceTiny,
                              Text(
                                "Success Rate",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                
                // Testimonial
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _GlassCard(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          "\"247 Job Center transformed my job search. My specialist handled everything professionally.\"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        verticalSpaceMedium,
                        Text(
                          "— Sarah K., Software Engineer",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const Spacer(),
                
                // Action Button
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: viewModel.navigateToLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1E4AD3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) {
    return OnboardingViewModel();
  }
}

/// A reusable glassmorphism card widget
class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _GlassCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// An animated background featuring floating circles
class _AnimatedBackgroundGeometry extends StatefulWidget {
  const _AnimatedBackgroundGeometry({Key? key}) : super(key: key);

  @override
  State<_AnimatedBackgroundGeometry> createState() =>
      _AnimatedBackgroundGeometryState();
}

class _AnimatedBackgroundGeometryState
    extends State<_AnimatedBackgroundGeometry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Repeating animation over 20 seconds loop
    _controller = AnimationController(
       vsync: this, 
       duration: const Duration(seconds: 20),
     )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // We use sin/cos with the controller value to make them drift in organic oval shapes
        return Stack(
          children: [
            // Top right circle
            Positioned(
              top: -50 + (math.sin(_controller.value * 2 * math.pi) * 15),
              right: -25 + (math.cos(_controller.value * 2 * math.pi) * 15),
              child: const _BlurCircle(size: 150),
            ),
            // Bottom left circle
            Positioned(
              bottom: -25 + (math.cos(_controller.value * 2 * math.pi) * 20),
              left: -50 + (math.sin(_controller.value * 2 * math.pi) * 20),
              child: const _BlurCircle(size: 200),
            ),
            // Center right subtle circle
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4 +
                  (math.sin(_controller.value * 2 * math.pi + math.pi) * 25),
              right: -75 +
                  (math.cos(_controller.value * 2 * math.pi + math.pi) * 10),
              child: const _BlurCircle(size: 125),
            ),
          ],
        );
      },
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final double size;

  const _BlurCircle({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightBlueAccent.withOpacity(0.15),
      ),
    );
  }
}
