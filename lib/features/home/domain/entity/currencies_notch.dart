import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

class CurrenciesNotch {
  final DateTime timestamp;
  final List<CurrencyEntity> currencies;

  CurrenciesNotch({required this.timestamp, required this.currencies});
}