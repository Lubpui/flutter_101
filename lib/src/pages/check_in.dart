// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_function_type_syntax_for_parameters, void_checks, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_101/src/bloc/total_courses/total_courses_bloc.dart';
import 'package:flutter_101/src/models/time_attendance.dart';
import 'package:flutter_101/src/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  Timer? _timer;
  String timeNow = DateFormat.jms('en_US').format(DateTime.now());

  void setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool('isLogin', value);
    });
  }

  void _clock() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLogin') == false) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          timeNow = DateFormat.jms('en_US').format(DateTime.now());
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _onTap(TotalCoursesState state) {
    if (state.timeAttendance.startTime != null &&
        state.timeAttendance.endTime != null) return;

    if (state.timeAttendance.startTime == null) {
      context.read<TotalCoursesBloc>().add(
            TotalCoursesEventCheckIn(
              TimeAttendance(
                startTime: DateTime.now(),
              ),
            ),
          );
    } else {
      context.read<TotalCoursesBloc>().add(
            TotalCoursesEventCheckIn(
              TimeAttendance(
                  startTime: state.timeAttendance.startTime,
                  endTime: DateTime.now()),
            ),
          );
    }
  }

  //            Stack(
  //               children: [
  //                 Center(
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(14),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 20),
  //                       child: TextField(
  //                         decoration: InputDecoration(
  //                           border: InputBorder.none,
  //                           hintText: 'หมายเหตุ',
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Row(
  //                   children: [
  //                     ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Color.fromRGBO(36, 45, 61, 1),
  //                           minimumSize: Size.fromHeight(50),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(14),
  //                           ),
  //                         ),
  //                         onPressed: () {},
  //                         child: Text('ยกเลิก')),
  //                     ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Color.fromRGBO(36, 45, 61, 1),
  //                           minimumSize: Size.fromHeight(50),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(14),
  //                           ),
  //                         ),
  //                         onPressed: () => _onTap(state),
  //                         child: Text('ยืนยัน'))
  //                   ],
  //                 )
  //               ],
  //             )

  void checkInModal(TotalCoursesState state) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              height: 120,
              padding: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'หมายเหตุ',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(36, 45, 61, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            _onTap(state);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'ยืนยัน',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _clock();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
          builder: (context, state) {
            return Container(
              color: Color(state.courses.color).withOpacity(0.7),
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(top: -150, right: -220, child: _buildCircle()),
                  Positioned(top: 50, right: -300, child: _buildCircle()),
                  Positioned(bottom: -200, left: -220, child: _buildCircle()),
                  Positioned(bottom: 10, left: -300, child: _buildCircle()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: double.infinity,
                    child: ListView(
                      children: [
                        // รหัสวิชา
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
                                  Navigator.pushNamed(
                                      context, AppRoute.totalCoursesPage);
                                },
                                icon: Icon(
                                  Iconsax.setting_35,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        // เวลาวันที่
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                DateFormat.EEEE('en_US').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'Noto Sans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMMd('en_US')
                                    .format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'Noto Sans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5),
                              BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
                                builder: (context, state) {
                                  return Text(
                                    timeNow,
                                    style: TextStyle(
                                      color: Color(state.courses.color),
                                      fontFamily: 'Noto Sans',
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Iconsax.location5,
                                        color: Colors.blue[400],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'เวลาเข้าเรียน',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontFamily: 'Noto Sans',
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${DateFormat.jm('en_US').format(state.courses.startClassTime)} - ${DateFormat.jm('en_US').format(state.courses.endClassTime)}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Noto Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        // ปุ่มกดเข้าเรียน
                        BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
                          builder: (context, state) {
                            return Container(
                              height: double.tryParse('200'),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.75),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: state.timeAttendance.startTime == null
                                  ? _buildCheckInButton(
                                      Colors.blue[400],
                                      Icon(
                                        Iconsax.location5,
                                        color: Colors.white,
                                        size: 70,
                                      ),
                                      'เข้าเรียน',
                                    )
                                  : state.timeAttendance.endTime == null
                                      ? _buildCheckInButton(
                                          Colors.orange[400],
                                          Icon(
                                            Iconsax.logout_1,
                                            color: Colors.white,
                                            size: 70,
                                          ),
                                          'เลิกเรียน',
                                        )
                                      : _buildCheckInButton(
                                          Colors.grey[400],
                                          Icon(
                                            Iconsax.copy_success,
                                            color: Colors.white,
                                            size: 70,
                                          ),
                                          'เสร็จสิ้น',
                                        ),
                            );
                          },
                        ),
                        SizedBox(height: 20),

                        // สรุปเวลาเข้าเรียน
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'สรุปเวลาเข้าเรียน',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '13 ชม',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
                                builder: (context, state) {
                                  return LinearProgressIndicator(
                                    minHeight: 25,
                                    borderRadius: BorderRadius.circular(8),
                                    value: 1,
                                    color: Color(state.courses.color),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'เข้าเรียน',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      BlocBuilder<TotalCoursesBloc,
                                          TotalCoursesState>(
                                        builder: (context, state) {
                                          return Text(
                                            state.timeAttendance.startTime !=
                                                    null
                                                ? DateFormat.jm('en_US').format(
                                                    state.timeAttendance
                                                        .startTime as DateTime)
                                                : '-',
                                            style: TextStyle(
                                              color: Colors.blue[400],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'เลิกเรียน',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      BlocBuilder<TotalCoursesBloc,
                                          TotalCoursesState>(
                                        builder: (context, state) {
                                          return Text(
                                            state.timeAttendance.endTime != null
                                                ? DateFormat.jm('en_US').format(
                                                    state.timeAttendance.endTime
                                                        as DateTime)
                                                : '-',
                                            style: TextStyle(
                                              color: Colors.orange[400],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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

  Widget _buildCheckInButton(Color? color, Icon icon, String titla) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<TotalCoursesBloc, TotalCoursesState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => state.timeAttendance.endTime == null
                  ? checkInModal(state)
                  : () {},
              child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: icon),
            );
          },
        ),
        SizedBox(height: 8),
        Text(
          titla,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 18,
            fontFamily: 'Noto Sans',
          ),
        ),
      ],
    );
  }
}
