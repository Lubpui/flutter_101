part of 'total_courses_bloc.dart';

abstract class TotalCoursesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TotalCoursesEventSelect extends TotalCoursesEvent {
  final Courses courses;
  TotalCoursesEventSelect(this.courses);
}
