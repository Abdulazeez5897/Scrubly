import 'package:stacked/stacked.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Function to handle the startup logic
  Future<void> runStartupLogic() async {
    // Wait for 4 seconds as requested
    await Future.delayed(const Duration(seconds: 4));

    // Navigate to the OnboardingView and clear the history
    await _navigationService.replaceWithOnboardingView();
  }
}
