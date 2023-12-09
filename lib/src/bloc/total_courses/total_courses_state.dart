part of 'total_courses_bloc.dart';

class TotalCoursesState extends Equatable {
  final Courses courses;

  const TotalCoursesState({required this.courses});

  TotalCoursesState copyWith({Courses? courses, int? currentIndexPage}) {
    return TotalCoursesState(courses: courses ?? this.courses);
  }

  @override
  List<Object?> get props => [courses];
}
