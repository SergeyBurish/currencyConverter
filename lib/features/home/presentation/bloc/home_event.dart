part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeScreenInitEvent extends HomeEvent {
}

class CurrenciesListOpenEvent extends HomeEvent {
}