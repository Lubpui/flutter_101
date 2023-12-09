// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/models/courses.dart';
import 'package:flutter_101/src/pages/check_in.dart';
import 'package:flutter_101/src/pages/profile_page.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_101/src/widget/card_course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;
  List<Widget> page = const [
    CheckIn(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0,
        actions: [
          BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
            builder: (context, state) {
              return CardCourse(
                courses: state.courses,
                onTap: _onTap,
                small: true,
              );
            },
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.grey[300],
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  void _onTap() {
    context.read<TotalCoursesBloc>().add(TotalCoursesEventSelect(Courses(
        code: '',
        name: '',
        color: 0,
        startClassTime: DateTime.now(),
        endClassTime: DateTime.now())));
    Navigator.pushNamed(context, AppRoute.totalCoursesPage);
  }
}
