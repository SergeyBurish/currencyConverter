import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

abstract interface class CurrencyLocalDataSource {
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency);
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency);
  Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> getSelectedCurrencies();
  Future<void> setValueFrom(String valueFrom);
  Future<String?> getValueFrom();
}

// TODO: DB
class CurrencyLocalDataSourceImp implements CurrencyLocalDataSource {
  static CurrencyEntity? _selectedCurrencyFrom;
  static CurrencyEntity? _selectedCurrencyTo;
  static String? _valueFrom;

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

  @override
  Future<void> setValueFrom(String valueFrom) async {
    _valueFrom = valueFrom;
  }

  @override
  Future<String?> getValueFrom() async {
    return _valueFrom;
  }
}