// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_notch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesNotchDto _$CurrenciesNotchDtoFromJson(Map<String, dynamic> json) =>
    CurrenciesNotchDto(
      timestamp: DateTime.parse(json['Timestamp'] as String),
      currencies: (json['Valute'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CurrencyDto.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CurrenciesNotchDtoToJson(CurrenciesNotchDto instance) =>
    <String, dynamic>{
      'Timestamp': instance.timestamp.toIso8601String(),
      'Valute': instance.currencies,
    };
