import 'package:currency_converter/features/home/data/dto/currency_dto.dart';
import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currencies_notch_dto.g.dart';

@JsonSerializable()
class CurrenciesNotchDto {
  @JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  @JsonKey(name: 'Valute')
  final Map<String, CurrencyDto> currencies;

  CurrenciesNotchDto({
    required this.timestamp,
    required this.currencies,
  });

  factory CurrenciesNotchDto.fromJson(Map<String, dynamic> json) => _$CurrenciesNotchDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrenciesNotchDtoToJson(this);
}

extension CurrenciesNotchDtoEx on CurrenciesNotchDto {
  CurrenciesNotch get toCurrenciesNotch => CurrenciesNotch(
    timestamp: timestamp, 
    localTimestamp: DateTime.now(), 
    currencies: currencies.values.toList(),
  );
}