part of 'home_bloc.dart';

sealed class HomeState {
  // defaults
  String get defCurrency => "Not set";
  CurrencyEntity? selectedCurrency;
  List<CurrencyEntity> get currencies => [];
}

final class HomeInitial extends HomeState {}

class DefCurrencyState extends HomeState {
  final String _defCurrency;
  DefCurrencyState({required String defCurrency}) : 
    _defCurrency = defCurrency;

  @override
  String get defCurrency => _defCurrency;
}

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
