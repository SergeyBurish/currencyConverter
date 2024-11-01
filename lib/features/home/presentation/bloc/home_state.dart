part of 'home_bloc.dart';

sealed class HomeState {
  // defaults
  CurrencyEntity? selectedCurrency;
  List<CurrencyEntity> get currencies => [];
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

class ValueToState extends HomeState {
  final String _valueTo;
  ValueToState({required String value}) : 
    _valueTo = value;

  @override
  String get valueTo => _valueTo;
}
