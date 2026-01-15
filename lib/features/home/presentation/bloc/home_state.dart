part of 'home_bloc.dart';

@CopyWith(constructor: '_')
class HomeState {
  final CurrencyEntity? selectedCurrency;
  final List<CurrencyEntity> currencies;
  final String fromExpression;
  final String toExpression;
  final String valueFrom;
  final String valueTo;
  final bool dialog;
  final bool dialogFrom;

  HomeState._({
    required this.selectedCurrency,
    required this.currencies,
    required this.fromExpression,
    required this.toExpression,
    required this.valueFrom,
    required this.valueTo,
    required this.dialog,
    required this.dialogFrom,
  });

  HomeState.initial() :
    selectedCurrency = null,
    currencies = [],
    fromExpression = '',
    toExpression = '',
    valueFrom = '',
    valueTo = '',
    dialog = false,
    dialogFrom = false;
}
