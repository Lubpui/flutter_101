// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/src/models/courses.dart';

class CardCourse extends StatefulWidget {
  final Courses courses;
  final VoidCallback onTap;
  final bool? small;

  const CardCourse(
      {Key? key, required this.courses, required this.onTap, this.small})
      : super(key: key);

  @override
  State<CardCourse> createState() => _CardCourseState();
}

class _CardCourseState extends State<CardCourse> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        width: widget.small == true ? 50 : 100,
        height: widget.small == true ? 50 : 100,
        margin: widget.small == true
            ? EdgeInsets.only(right: 20)
            : EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(widget.courses.color),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(children: [
          Center(
            child: Text(
              widget.courses.code,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.small == true ? 10 : 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          widget.small == true
              ? Container()
              : Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    widget.courses.name,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
        ]),
      ),
    );
  }
}
