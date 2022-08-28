part of 'app_navigator_bloc.dart';

class AppNavigatorState extends Equatable {
  const AppNavigatorState({
    required this.pages,
  });

  final List<Page> pages;

  AppNavigatorState copyWith({
    List<Page>? pages,
    NavigatorManager? navigatorManager,
  }) {
    return AppNavigatorState(
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object?> get props => [pages];
}
