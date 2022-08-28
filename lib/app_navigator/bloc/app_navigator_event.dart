part of 'app_navigator_bloc.dart';

abstract class AppNavigatorEvent extends Equatable {
  const AppNavigatorEvent();

  @override
  List<Object?> get props => [];
}

class PagePushEvent extends AppNavigatorEvent {
  const PagePushEvent(this.page);
  final Page page;

  @override
  List<Object?> get props => [page];
}

class PagePopEvent extends AppNavigatorEvent {
  const PagePopEvent(this.page);
  final Page page;

  @override
  List<Object?> get props => [page];
}

class LastPagePopEvent extends AppNavigatorEvent {}

class FirstPagePopEvent extends AppNavigatorEvent {}
