part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  // defaults
  String get defCurrency => "Not set";
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

class CurrenciesListState extends HomeState {
  final List<CurrencyEntity> _currencies;
  CurrenciesListState({required List<CurrencyEntity> currencies}) : 
    _currencies = currencies;

  @override
  List<CurrencyEntity> get currencies => _currencies;
}
