import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';

class CacheService {
  static CurrenciesNotch? _currenciesNotch;
  static void cache(CurrenciesNotch currenciesNotch) => _currenciesNotch = currenciesNotch;
  static CurrenciesNotch? getCached() => _currenciesNotch;
}