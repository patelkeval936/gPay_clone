import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'router/app_router.dart';
import 'values/app_strings.dart';
import 'values/app_theme.dart';
import 'view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.theme,
      onGenerateRoute: (settings) {
        return AppRouter.generateRoutes(settings);
      },
      home: const HomeScreen(),
    );
  }
}
