// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';
import 'package:flutter_101/src/models/courses.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'total_courses_event.dart';
part 'total_courses_state.dart';

class TotalCoursesBloc extends Bloc<TotalCoursesEvent, TotalCoursesState> {
  TotalCoursesBloc()
      : super(
            TotalCoursesState(courses: Courses(code: '', name: '', color: 0))) {
    on<TotalCoursesEventSelect>((event, emit) {
      emit(state.copyWith(courses: event.courses));
    });
  }
}
