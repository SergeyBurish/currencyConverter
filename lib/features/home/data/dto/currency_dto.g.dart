// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
  name: json['Name'] as String,
  charCode: json['CharCode'] as String,
  value: (json['Value'] as num).toDouble(),
  nominal: (json['Nominal'] as num).toInt(),
);

Map<String, dynamic> _$CurrencyDtoToJson(CurrencyDto instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'CharCode': instance.charCode,
      'Value': instance.value,
      'Nominal': instance.nominal,
    };
