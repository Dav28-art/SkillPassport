
import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const SkillPassportApp());
}

class SkillPassportApp extends StatelessWidget {
  const SkillPassportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillPassport Africa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}