part of 'home_bloc.dart';

sealed class HomeState {
  // defaults
  CurrencyEntity? selectedCurrency;
  List<CurrencyEntity> get currencies => [];
  String get fromExpression => "";
  String get toExpression => "";
  String get valueFrom => "";
  String get valueTo => "";
}

final class HomeInitial extends HomeState {}

class SelectedCurrencyState extends HomeState {
  final CurrencyEntity _selectedCurrency;
  final String _fromExpression;
  final String _toExpression;
  SelectedCurrencyState({required CurrencyEntity selectedCurrency}) : 
    _selectedCurrency = selectedCurrency,
    _fromExpression = selectedCurrency.fromRUR,
    _toExpression = selectedCurrency.toRUR;

  @override
  CurrencyEntity? get selectedCurrency => _selectedCurrency;

  @override
  String get fromExpression => _fromExpression;

  @override
  String get toExpression => _toExpression;
}

class CurrenciesListState extends HomeState {
  final List<CurrencyEntity> _currencies;
  CurrenciesListState({required List<CurrencyEntity> currencies}) : 
    _currencies = currencies;

  @override
  List<CurrencyEntity> get currencies => _currencies;
}

class ValueFromState extends HomeState {
  final String _valueFrom;
  ValueFromState({required String value}) : 
    _valueFrom = value;

  @override
  String get valueFrom => _valueFrom;
}

class ValueToState extends HomeState {
  final String _valueTo;
  ValueToState({required String value}) : 
    _valueTo = value;

  @override
  String get valueTo => _valueTo;
}

class ValuesFromToState extends HomeState {
  final String _valueFrom;
  final String _valueTo;
  ValuesFromToState({required String valueFrom, required String valueTo}) : 
    _valueFrom = valueFrom, _valueTo = valueTo;

  @override
  String get valueFrom => _valueFrom;

  @override
  String get valueTo => _valueTo;
}
