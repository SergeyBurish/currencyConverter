import 'package:currency_converter/features/home/data/data_sources/cache_service.dart';
import 'package:currency_converter/features/home/data/data_sources/cbr_service.dart';
import 'package:currency_converter/features/home/data/dto/cbr_dto.dart';
import 'package:currency_converter/features/home/data/mapper/currency_mapper.dart';
import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';

class CurrencyRepositoryImp implements CurrencyRepository{
  final CbrService _cbrService;

  CurrencyRepositoryImp() : _cbrService = CbrService();

  @override
  Future<CurrenciesNotch?> getCurrenciesNotch() async {
    CurrenciesNotch? currenciesNotch = CacheService.getCached();
    if (currenciesNotch != null) {
      return currenciesNotch;
    }
    
    try {
      CbrDto response = await _cbrService.getExchangeRates();
      currenciesNotch = CurrencyMapper.fromDto(response);
      if (currenciesNotch != null) {
        CacheService.cache(currenciesNotch);
      }
      return currenciesNotch;
    } catch (e) {
      return null;
    }
  }  
}