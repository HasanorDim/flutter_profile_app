import 'package:flutter/material.dart';
import 'package:profile_app_/provider/theme_manager.dart';
import 'package:profile_app_/routes/main.route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeManager().isDarkMode,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'Hasanor Dimasimpan - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2196F3),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2196F3),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          navigatorKey: AppRoutes.navigatorKey,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
