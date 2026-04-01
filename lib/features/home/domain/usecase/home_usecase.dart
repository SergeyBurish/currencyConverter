import 'package:collection/collection.dart';
import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/repository/currency_repository.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class CurrencyProducer{
  Future<Either<void, CurrencyEntity>> getDefaultCurrency();
  Future<Either<void, List<CurrencyEntity>>> getCurrenciesList();
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency);
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency);
  Future<String> getValueTo(String valueFrom);
  Future<String> getValueFrom(String valueTo);
}

class CurrencyUsecase implements CurrencyProducer{
  final CurrencyRepository repository;

  CurrencyUsecase({required this.repository});

  @override
  Future<Either<void, CurrencyEntity>> getDefaultCurrency() async {
    CurrenciesNotch? currenciesNotch = await repository.getCurrenciesNotch();
    CurrencyEntity? usd = currenciesNotch?.currencies.firstWhereOrNull((element) => element.charCode == 'USD');
    CurrencyEntity? defaultCurrency = usd ?? currenciesNotch?.currencies.firstOrNull;

    if (defaultCurrency != null) {
      await repository.setSelectedCurrencyTo(defaultCurrency); // TODO: refactor
      return Right(defaultCurrency);
    }
    return const Left(null);
  }
  
  @override
  Future<Either<void, List<CurrencyEntity>>> getCurrenciesList() async {
    CurrenciesNotch? currenciesNotch = await repository.getCurrenciesNotch();
    if (currenciesNotch != null) {
      return Right(currenciesNotch.currencies);
    }
    return const Left(null);
  }
  
  @override
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency) => repository.setSelectedCurrencyFrom(currency);

  @override
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency) => repository.setSelectedCurrencyTo(currency);

  @override
  Future<String> getValueTo(String valueFrom) async {
    String valueTo = '';
    if (valueFrom.isNotEmpty) {
      final currencies = await repository.getSelectedCurrencies();
      if (currencies.selectedCurrencyTo != null) {
        try {
          final double from = double.parse(valueFrom);
          final to = from * currencies.selectedCurrencyTo!.nominal.toDouble() / currencies.selectedCurrencyTo!.value;
          valueTo = to.toString();
        } catch (e) {
          print(e);
        }
      }
    }
    return valueTo;
  }

  @override
  Future<String> getValueFrom(String valueTo) async {
    String valueFrom = '';
    if (valueTo.isNotEmpty) {
      final currencies = await repository.getSelectedCurrencies();
      if (currencies.selectedCurrencyTo != null) {
        try {
          final double to = double.parse(valueTo);
          final double from = to * currencies.selectedCurrencyTo!.value / currencies.selectedCurrencyTo!.nominal.toDouble();
          valueFrom = from.toString();
        } catch (e) {
          print(e);
        }
      }
    }
    return valueFrom;
  }
}
