import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victorbellofoundation/app_navigator/app_navigator.dart';

part 'app_navigator_state.dart';
part 'app_navigator_event.dart';

typedef Emit = Emitter<AppNavigatorState>;

class AppNavigatorBloc extends Bloc<AppNavigatorEvent, AppNavigatorState> {
  AppNavigatorBloc() : super(const AppNavigatorState(pages: [])) {
    on<PagePushEvent>(_pagePushEvent);
    on<LastPagePopEvent>(_lastPagePopEvent);
    on<FirstPagePopEvent>(_firstPagePopEvent);
    on<PagePopEvent>(_pagePopEvent);
  }

  _pagePushEvent(PagePushEvent event, Emit emit) {
    var pages = List.of(state.pages);
    pages.add(event.page);
    emit(state.copyWith(pages: pages));
  }

  _lastPagePopEvent(LastPagePopEvent event, Emit emit) {
    var pages = state.pages;
    pages.removeLast();
    emit(state.copyWith(pages: pages));
  }

  _firstPagePopEvent(FirstPagePopEvent event, Emit emit) {
    var pages = state.pages;
    pages.removeAt(0);
    emit(state.copyWith(pages: pages));
  }

  _pagePopEvent(PagePopEvent event, Emit emit) {
    var pages = state.pages;
    pages.remove(event.page);
    emit(state.copyWith(pages: pages));
  }
}
