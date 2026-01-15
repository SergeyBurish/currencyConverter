part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeScreenInitEvent extends HomeEvent {
}

class CurrenciesListOpenEvent extends HomeEvent {
  final String valueFrom;
  final bool dialog;
  final bool dialogFrom;

  CurrenciesListOpenEvent({
    required this.valueFrom,
    this.dialog = false,
    this.dialogFrom = false,
  });
}

class CurrencyFromSelectedEvent extends HomeEvent {
  final CurrencyEntity selectedCurrencyFrom;

  CurrencyFromSelectedEvent({required this.selectedCurrencyFrom});
}

class CurrencyToSelectedEvent extends HomeEvent {
  final CurrencyEntity selectedCurrencyTo;

  CurrencyToSelectedEvent({required this.selectedCurrencyTo});
}

class ValueFromUpdatedEvent extends HomeEvent {
  final String valueFrom;

  ValueFromUpdatedEvent({required this.valueFrom});
}

class ValueToUpdatedEvent extends HomeEvent {
  final String valueTo;

  ValueToUpdatedEvent({required this.valueTo});
}

class RecalculateValueToEvent extends HomeEvent {
}