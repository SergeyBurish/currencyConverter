
import 'package:currency_converter/features/home/data/dto/cbr_dto.dart';
import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

class CurrencyMapper {
  static CurrenciesNotch? fromDto(CbrDto cbrDto) {
    if (cbrDto.timestamp != null) {
      final DateTime timestamp = DateTime.parse(cbrDto.timestamp!);

      List<CurrencyEntity> currencies = [];
    
      for(var currencyDto in cbrDto.currencies) {
        if (currencyDto.name != null && 
            currencyDto.charCode != null &&
            currencyDto.value != null &&
            currencyDto.nominal != null) {
          currencies.add(CurrencyEntity(
            name: currencyDto.name!, 
            charCode: currencyDto.charCode!, 
            value: currencyDto.value!,
            nominal: currencyDto.nominal!)
          );
        }
      }

      return CurrenciesNotch(timestamp: timestamp, currencies: currencies, localTimestamp: DateTime.now());
    }

    return null;
  }
}