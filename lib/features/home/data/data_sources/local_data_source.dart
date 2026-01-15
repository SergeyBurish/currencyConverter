import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

abstract interface class CurrencyLocalDataSource {
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency);
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency);
  Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> getSelectedCurrencies();
}

class CurrencyLocalDataSourceImp implements CurrencyLocalDataSource {
  static CurrencyEntity? _selectedCurrencyFrom;
  static CurrencyEntity? _selectedCurrencyTo;

  @override
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency) async {
    _selectedCurrencyFrom = currency;
  }

  @override
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency) async {
    _selectedCurrencyTo = currency;
  }

  @override
  Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> getSelectedCurrencies() async {
    return (selectedCurrencyFrom: _selectedCurrencyFrom, selectedCurrencyTo: _selectedCurrencyTo);
  }
}