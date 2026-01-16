import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/src/app/main_bottom_navigationbar.dart';
import 'package:mobile_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:mobile_app/src/features/home/presentation/screens/home_serren.dart';
import 'package:mobile_app/src/features/user_management/presentation/screens/add_user_page.dart';

class AppRoutes {
  static const String loginScreen = 'login-screen';
  static const String homeScreen = 'home-screen';
  static const String mainBottomNavigation = 'main-bottom-nav';
  static const String addUserPage = 'add-user-page';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.homeScreen:
      return MaterialPageRoute(builder: (_) => HomeSerren());
    case AppRoutes.mainBottomNavigation:
      return MaterialPageRoute(builder: (_) => MainBottomNavigationbar());
    case AppRoutes.addUserPage:
      return MaterialPageRoute(builder: (_) => AddUserPage());
  }
}
