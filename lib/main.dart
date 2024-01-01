// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/pages/splash_screen.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final totalCoursesBloc = BlocProvider<TotalCoursesBloc>(
      create: (context) => TotalCoursesBloc(),
    );

    return MultiBlocProvider(
      providers: [totalCoursesBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute.all,
        home: SplashScreen(),
      ),
    );
  }
}
