import 'package:flutter/material.dart';
import 'package:flutter_101/src/pages/login/login_page.dart';
import 'package:flutter_101/src/pages/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101',
      routes: AppRoute.all,
      home: LoginPage(),
    );
  }
}
