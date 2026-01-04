import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

abstract interface class CurrencyRepository{
    Future<CurrenciesNotch?> getCurrenciesNotch();
    Future<void> setSelectedCurrencyFrom(CurrencyEntity currency);
    Future<void> setSelectedCurrencyTo(CurrencyEntity currency);
    Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> 
      getSelectedCurrencies();
    Future<void> setValueFrom(String valueFrom);
    Future<String?> getValueFrom();
}
