import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_dto.g.dart';

@JsonSerializable()
class CurrencyDto extends CurrencyEntity {
  @override
  @JsonKey(name: 'Name')
  String get name;

  @override
  @JsonKey(name: 'CharCode')
  String get charCode;

  @override
  @JsonKey(name: 'Value')
  double get value;

  @override
  @JsonKey(name: 'Nominal')
  int get nominal;

  CurrencyDto({
    required super.name,
    required super.charCode,
    required super.value,
    required super.nominal,
  });

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyDtoToJson(this);
}