import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

class CurrenciesNotch {
  final DateTime timestamp;
  final DateTime localTimestamp;
  final List<CurrencyEntity> currencies;

  CurrenciesNotch({required this.timestamp, required this.localTimestamp, required this.currencies});
}