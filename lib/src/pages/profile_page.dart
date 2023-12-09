// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool('isLogin', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
              builder: (context, state) {
                return Text('');
              },
            ),
          ],
        ),
      ),
    );
  }
}
