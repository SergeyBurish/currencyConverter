part of 'home_bloc.dart';

sealed class HomeState {
  // defaults
  CurrencyEntity? selectedCurrency;
  List<CurrencyEntity> get currencies => [];
  String get valueFrom => "";
  String get valueTo => "";
}

final class HomeInitial extends HomeState {}

class SelectedCurrencyState extends HomeState {
  final CurrencyEntity _selectedCurrency;
  SelectedCurrencyState({required CurrencyEntity selectedCurrency}) : 
    _selectedCurrency = selectedCurrency;

  @override
  CurrencyEntity? get selectedCurrency => _selectedCurrency;
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
