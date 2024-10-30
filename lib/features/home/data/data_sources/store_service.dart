import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

// TODO: DB
class StoreService {
  static CurrencyEntity? _selectedCurrency;
  static String? _valueFrom;
  Future<void> setSelectedCurrency(CurrencyEntity currency) async {
    _selectedCurrency = currency;
  }

  Future<CurrencyEntity?> getSelectedCurrency() async {
    return _selectedCurrency;
  }

  Future<void> setValueFrom(String valueFrom) async {
    _valueFrom = valueFrom;
  }

  Future<String?> getValueFrom() async {
    return _valueFrom;
  }
}