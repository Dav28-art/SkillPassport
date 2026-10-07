import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/matching/presentation/pages/matching_page.dart';
import '../../features/skill_passport/presentation/pages/skill_passport_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';
  static const matching = '/matching';
  static const skillPassport = '/skill-passport';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashPage(),
        login: (_) => const LoginPage(),
        register: (_) => const RegisterPage(),
        dashboard: (_) => const DashboardPage(),
        matching: (_) => const MatchingPage(),
        skillPassport: (_) => const SkillPassportPage(),
      };
}
