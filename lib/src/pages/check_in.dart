// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/models/courses.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
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
        body: BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
          builder: (context, state) {
            return Container(
              color: Color(state.courses.color),
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(top: -150, right: -220, child: _buildCircle()),
                  Positioned(top: 50, right: -300, child: _buildCircle()),
                  Positioned(bottom: -200, left: -220, child: _buildCircle()),
                  Positioned(bottom: 10, left: -300, child: _buildCircle()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    height: double.infinity,
                    child: ListView(
                      children: [
                        Container(
                          height: double.tryParse('40'),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Iconsax.document,
                                      size: double.tryParse('20'),
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Text(
                                    state.courses.code,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    context.read<TotalCoursesBloc>().add(
                                          TotalCoursesEventSelect(
                                            Courses(
                                              code: '',
                                              name: '',
                                              color: 0,
                                            ),
                                          ),
                                        );
                                    Navigator.pushNamed(
                                        context, AppRoute.totalCoursesPage);
                                  },
                                  icon: Icon(
                                    Iconsax.setting_35,
                                    color: Colors.grey[700],
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Color.fromRGBO(255, 255, 255, 0.2),
      ),
    );
  }
}
