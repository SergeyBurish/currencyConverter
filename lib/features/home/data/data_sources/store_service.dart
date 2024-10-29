import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

// TODO: DB
class StoreService {
  static CurrencyEntity? _selectedCurrency;
  Future<void> setSelectedCurrency(CurrencyEntity currency) async {
    _selectedCurrency = currency;
  }

  Future<CurrencyEntity?> getSelectedCurrency() async {
    return _selectedCurrency;
  }
}