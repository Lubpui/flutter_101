// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarState(currentIndexPage: 1)) {
    on<NavigationBarEventChangePage>((event, emit) {
      emit(state.copyWith(currentIndexPage: event.currentIndexPage));
    });
  }
}
