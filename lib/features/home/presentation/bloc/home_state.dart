part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  // defaults
  String get defCurrency => "Not set";
}

final class HomeInitial extends HomeState {}

class DefCurrencyState extends HomeState {
  final String _defCurrency;
  DefCurrencyState({required String defCurrency}) : 
    _defCurrency = defCurrency;

  @override
  String get defCurrency => _defCurrency;
}
