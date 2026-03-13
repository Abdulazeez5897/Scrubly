import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'firebase_options.dart';

// Temporary global variable for UI Mode until we build your LocalStorage feature
final ValueNotifier<ThemeMode> uiMode = ValueNotifier(ThemeMode.light);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 2. Initialize Stacked Architecture
  await setupLocator();
  // setupDialogUi(); // TODO: Uncomment this once we generate Stacked Dialogs
  
  /* TODO: Re-enable these once we install the packages in pubspec.yaml!
   await FirebaseAppCheck.instance.activate(
     androidProvider: AndroidProvider.debug,
   );
   await FirebaseMessaging.instance.requestPermission();
   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  */

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    fetchUiState();
    super.initState();
  }

  void fetchUiState() async {
    // TODO: Replace this with your LocalStorage fetcher later
    // For now, we will just default to the system brightness so it doesn't crash
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    uiMode.value = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: uiMode,
      builder: (context, value, child) => MaterialApp(
        title: '247 Job Center',
        
        // App Theme Configuration
        theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.white, 
        ),
        darkTheme: ThemeData.dark(),
        themeMode: value,

        // Stacked Routing Magic
        // NOTE: Make sure Routes.startupView matches what is in your app.router.dart!
        initialRoute: Routes.startupView, 
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
