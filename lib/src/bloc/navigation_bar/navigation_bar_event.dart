part of 'navigation_bar_bloc.dart';

abstract class NavigationBarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigationBarEventChangePage extends NavigationBarEvent {
  final int currentIndexPage;
  NavigationBarEventChangePage(this.currentIndexPage);
}
