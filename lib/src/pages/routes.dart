import 'package:flutter/material.dart';
import 'package:flutter_101/src/pages/home/home_page.dart';
import 'package:flutter_101/src/pages/login/login_page.dart';
import 'package:flutter_101/src/pages/register/register_page.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';

  static get all => <String, WidgetBuilder>{
        home: (BuildContext context) => const HomePage(),
        login: (BuildContext context) => const LoginPage(),
        register: (BuildContext context) => const RegisterPage(),
      };
}
