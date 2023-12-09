part of 'total_courses_bloc.dart';

class TotalCoursesState extends Equatable {
  final Courses courses;
  final TimeAttendance timeAttendance;

  const TotalCoursesState(
      {required this.courses, required this.timeAttendance});

  TotalCoursesState copyWith(
      {Courses? courses, TimeAttendance? timeAttendance}) {
    return TotalCoursesState(
      courses: courses ?? this.courses,
      timeAttendance: timeAttendance ?? this.timeAttendance,
    );
  }

  @override
  List<Object?> get props => [courses, timeAttendance];
}
