part of 'home_bloc.dart';

@CopyWith(constructor: '_')
class HomeState {
  final CurrencyEntity? selectedCurrency;
  final List<CurrencyEntity> currencies;
  final String fromExpression;
  final String toExpression;
  final String valueFrom;
  final String valueTo;

  HomeState._({
    required this.selectedCurrency,
    required this.currencies,
    required this.fromExpression,
    required this.toExpression,
    required this.valueFrom,
    required this.valueTo,
  });

  HomeState.initial() :
    selectedCurrency = null,
    currencies = [],
    fromExpression = '',
    toExpression = '',
    valueFrom = '',
    valueTo = '';
}
