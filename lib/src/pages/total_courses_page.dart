// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, void_checks

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/models/courses.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_101/src/widget/card_course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotalCoursesPage extends StatefulWidget {
  const TotalCoursesPage({super.key});

  @override
  State<TotalCoursesPage> createState() => _TotalCoursesPageState();
}

class _TotalCoursesPageState extends State<TotalCoursesPage> {
  final List<Courses> _courses = [
    Courses(
      code: "CE454",
      name: "Mobile Application",
      color: 0xFF4ade80,
    ),
    Courses(
      code: "CE437",
      name: "Principles Of Robotics",
      color: 0xFF22d3ee,
    ),
    Courses(
      code: "CE435",
      name: "Image Processing",
      color: 0xFF818cf8,
    ),
    Courses(
      code: "IJP101",
      name: "Japanese",
      color: 0xFFf472b6,
    ),
    Courses(
      code: "CE411",
      name: "Software Engineering",
      color: 0xFFfbbf24,
    ),
  ];

  void setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool('isLogin', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(context),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _courses.length,
          itemBuilder: (context, i) {
            return _buildListViewContent(i);
          }),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {
            setIsLogin(false);
            Navigator.pushNamed(context, AppRoute.login);
          },
          icon:
              Icon(Icons.logout_rounded, color: Color.fromRGBO(36, 45, 61, 1)),
        ),
        centerTitle: true,
        title: Text(
          'Total Courses',
          style: TextStyle(
            color: Color.fromRGBO(36, 45, 61, 1),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.profile);
              },
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/images/profile.jpg')),
            ),
          )
        ],
      ),
    );
  }

  _buildListViewContent(int i) {
    return CardCourse(
      courses: _courses[i],
      onTap: () {
        context
            .read<TotalCoursesBloc>()
            .add(TotalCoursesEventSelect(_courses[i]));
        Navigator.pushNamed(context, AppRoute.navigationMenu);
      },
    );
  }
}
