import 'package:currency_converter/features/home/data/data_sources/cache_service.dart';
import 'package:currency_converter/features/home/data/data_sources/local_data_source.dart';
import 'package:currency_converter/features/home/data/data_sources/remote_data_source.dart';
import 'package:currency_converter/features/home/data/dto/currencies_notch_dto.dart';
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
      CurrenciesNotchDto response = await remoteDataSource.getExchangeRates();
      currenciesNotch = response.toCurrenciesNotch;
      CacheService.cache(currenciesNotch);
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
}