import 'package:currency_converter/features/home/data/data_sources/cache_service.dart';
import 'package:currency_converter/features/home/data/data_sources/cbr_service.dart';
import 'package:currency_converter/features/home/data/data_sources/store_service.dart';
import 'package:currency_converter/features/home/data/dto/cbr_dto.dart';
import 'package:currency_converter/features/home/data/mapper/currency_mapper.dart';
import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/repository/currency_repository.dart';

class CurrencyRepositoryImp implements CurrencyRepository{
  final CurrencyRemoteDataSource remoteDataSource;
  final CurrencyLocalDataSource localDataSource;

  CurrencyRepositoryImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<CurrenciesNotch?> getCurrenciesNotch() async {
    CurrenciesNotch? currenciesNotch = CacheService.getCached();
    if (currenciesNotch != null) {
      Duration difference = DateTime.now().difference(currenciesNotch.localTimestamp);
      if (difference < const Duration(minutes: 5)) {
        return currenciesNotch;
      }
    }
    
    try {
      CbrDto response = await remoteDataSource.getExchangeRates();
      currenciesNotch = CurrencyMapper.fromDto(response);
      if (currenciesNotch != null) {
        CacheService.cache(currenciesNotch);
      }
      return currenciesNotch;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency) {
    return localDataSource.setSelectedCurrencyFrom(currency);
  }

  @override
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency) {
    return localDataSource.setSelectedCurrencyTo(currency);
  }
  
  @override
  Future<({CurrencyEntity? selectedCurrencyFrom, CurrencyEntity? selectedCurrencyTo})> getSelectedCurrencies() {
    return localDataSource.getSelectedCurrencies();
  }
  
  @override
  Future<void> setValueFrom(String valueFrom) {
    return localDataSource.setValueFrom(valueFrom);
  }
  
  @override
  Future<String?> getValueFrom() {
    return localDataSource.getValueFrom();
  }  
}