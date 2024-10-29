part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeScreenInitEvent extends HomeEvent {
}

class CurrenciesListOpenEvent extends HomeEvent {
}

class CurrencySelectedEvent extends HomeEvent {
  final CurrencyEntity selectedCurrency;

  CurrencySelectedEvent({required this.selectedCurrency});
}

class ValueFromUpdatedEvent extends HomeEvent {
  final String valueFrom;

  ValueFromUpdatedEvent({required this.valueFrom});
}