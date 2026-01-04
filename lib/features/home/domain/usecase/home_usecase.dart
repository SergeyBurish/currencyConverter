import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/repository/currency_repository.dart';

abstract interface class CurrencyProducer{
    Future<CurrencyEntity?> getDefaultCurrency();
    Future<List<CurrencyEntity>?> getCurrenciesList();
    Future<void> setSelectedCurrencyFrom(CurrencyEntity currency);
    Future<void> setSelectedCurrencyTo(CurrencyEntity currency);
    Future<void> setValueFrom(String valueFrom);
    Future<String> getValueTo(String valueFrom);
    Future<String> getValueFrom(String valueTo);
    Future<({String valueFrom, String valueTo})> recalculateValueTo();
}

class CurrencyUsecase implements CurrencyProducer{
  final CurrencyRepository repository;

  CurrencyUsecase({required this.repository});

  @override
  Future<CurrencyEntity?> getDefaultCurrency() async {
    CurrenciesNotch? currenciesNotch = await repository.getCurrenciesNotch();
    CurrencyEntity? usd = currenciesNotch?.currencies.firstWhere((element) => element.charCode == "USD");
    if (usd != null) {
      return usd;
    }
    return currenciesNotch?.currencies.first;
  }
  
  @override
  Future<List<CurrencyEntity>?> getCurrenciesList() async {
    CurrenciesNotch? currenciesNotch = await repository.getCurrenciesNotch();
    return currenciesNotch?.currencies;
  }
  
  @override
  Future<void> setSelectedCurrencyFrom(CurrencyEntity currency) => repository.setSelectedCurrencyFrom(currency);

  @override
  Future<void> setSelectedCurrencyTo(CurrencyEntity currency) => repository.setSelectedCurrencyTo(currency);

  @override
  Future<void> setValueFrom(String valueFrom) => repository.setValueFrom(valueFrom);
  
  @override
  Future<String> getValueTo(String valueFrom) => _calculateValueTo(valueFrom);

  @override
  Future<String> getValueFrom(String valueTo) => _calculateValueFrom(valueTo);
  
  @override
  Future<({String valueFrom, String valueTo})> recalculateValueTo() async {
    String? valueFrom = await repository.getValueFrom();
    if (valueFrom != null) {
      String? valueTo = await _calculateValueTo(valueFrom);
      return (valueFrom: valueFrom, valueTo: valueTo);
    }
    return (valueFrom: "", valueTo: "");
  }

  Future<String> _calculateValueTo(String valueFrom) async {
    String valueTo = "";
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

  Future<String> _calculateValueFrom(String valueTo) async {
    String valueFrom = "";
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
