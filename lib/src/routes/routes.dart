// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/src/menu/navigation_menu.dart';
import 'package:flutter_101/src/pages/check_in.dart';
import 'package:flutter_101/src/pages/login_page.dart';
import 'package:flutter_101/src/pages/profile_page.dart';
import 'package:flutter_101/src/pages/splash_screen.dart';
import 'package:flutter_101/src/pages/total_courses_page.dart';

class AppRoute {
  static const login = 'login';
  static const splashScreen = 'splashScreen';
  static const totalCoursesPage = 'totalCoursesPage';
  static const profile = 'profile';
  static const checkIn = 'checkIn';
  static const navigationMenu = 'navigationMenu';

  static get all => <String, WidgetBuilder>{
        login: (BuildContext context) => const LoginPage(),
        splashScreen: (BuildContext context) => const SplashScreen(),
        totalCoursesPage: (BuildContext context) => const TotalCoursesPage(),
        profile: (BuildContext context) => const ProfilePage(),
        checkIn: (BuildContext context) => const CheckIn(),
        navigationMenu: (BuildContext context) => const NavigationMenu(),
      };
}
