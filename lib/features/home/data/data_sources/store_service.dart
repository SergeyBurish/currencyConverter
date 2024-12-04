import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

// TODO: DB
class StoreService {
  static CurrencyEntity? _selectedCurrencyFrom;
  static CurrencyEntity? _selectedCurrencyTo;
  static String? _valueFrom;

  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency) async {
    _selectedCurrencyFrom = currency;
  }

  Future<void> setSelectedCurrencyTo(CurrencyEntity currency) async {
    _selectedCurrencyTo = currency;
  }

  Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> getSelectedCurrencies() async {
    return (selectedCurrencyFrom: _selectedCurrencyFrom, selectedCurrencyTo: _selectedCurrencyTo);
  }

  Future<void> setValueFrom(String valueFrom) async {
    _valueFrom = valueFrom;
  }

  Future<String?> getValueFrom() async {
    return _valueFrom;
  }
}