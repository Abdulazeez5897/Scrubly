import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/data/repositories/repository.dart';
import '../core/network/api-service.dart';
import '../core/utils/local_storage.dart';
import '../services/authentication_service.dart';
import '../ui/dialogs/info_alert_dialog.dart';

import '../ui/views/login/login_view.dart';
import '../ui/views/homeView.dart';
import '../ui/views/dashboard.dart';
// @stacked-import
/// @author Usman Abdulazeez
/// email: abdulazeezusman732@gmail.com
/// Aug, 2025
///

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    // MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: DashboardView),

    // MaterialRoute(page: NotificationView),
    // MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocalStorage),
    LazySingleton(classType: Repository),
    LazySingleton(classType: AuthenticationService),
    // @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
