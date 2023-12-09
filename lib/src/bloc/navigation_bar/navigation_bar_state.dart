part of 'navigation_bar_bloc.dart';

class NavigationBarState extends Equatable {
  final int currentIndexPage;

  const NavigationBarState({required this.currentIndexPage});

  NavigationBarState copyWith({int? currentIndexPage}) {
    return NavigationBarState(
      currentIndexPage: currentIndexPage ?? this.currentIndexPage,
    );
  }

  @override
  List<Object> get props => [currentIndexPage];
}
