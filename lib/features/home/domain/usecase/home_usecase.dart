import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

abstract interface class CurrencyProducer{
    Future<CurrencyEntity?> getDefaultCurrency();
    Future<List<CurrencyEntity>?> getCurrenciesList();
    Future<void> setSelectedCurrency(CurrencyEntity currency);
    Future<void> setValueFrom(String valueFrom);
    Future<String> getValueTo(String valueFrom);
    Future<String> getValueFrom(String valueTo);
    Future<String> recalculateValueTo();
}

abstract interface class CurrencyRepository{
    Future<CurrenciesNotch?> getCurrenciesNotch();
    Future<void> setSelectedCurrency(CurrencyEntity currency);
    Future<CurrencyEntity?> getSelectedCurrency();
    Future<void> setValueFrom(String valueFrom);
    Future<String?> getValueFrom();
}

class HomeUsecase {
  static late final _HomeUsecaseImp _homeUsecaseImp;
  static init(CurrencyRepository repository) {
    _homeUsecaseImp = _HomeUsecaseImp(repository: repository);
  }

  static CurrencyProducer get currencyProducer => _homeUsecaseImp;
}

class _HomeUsecaseImp implements CurrencyProducer{
  final CurrencyRepository repository;

  _HomeUsecaseImp({required this.repository});

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
  Future<void> setSelectedCurrency(CurrencyEntity currency) => repository.setSelectedCurrency(currency);

    @override
  Future<void> setValueFrom(String valueFrom) => repository.setValueFrom(valueFrom);
  
  @override
  Future<String> getValueTo(String valueFrom) => _calculateValueTo(valueFrom);

  @override
  Future<String> getValueFrom(String valueTo) => _calculateValueFrom(valueTo);
  
  @override
  Future<String> recalculateValueTo() async {
    String? valueFrom = await repository.getValueFrom();
    if (valueFrom != null) {
      return _calculateValueTo(valueFrom);
    }
    return "";
  }

  Future<String> _calculateValueTo(String valueFrom) async {
    String valueTo = "";
    if (valueFrom.isNotEmpty) {
      CurrencyEntity? selectedCurrency = await repository.getSelectedCurrency();
      if (selectedCurrency != null) {
        try {
          final double from = double.parse(valueFrom);
          final to = from * selectedCurrency.nominal.toDouble() / selectedCurrency.value;
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
      CurrencyEntity? selectedCurrency = await repository.getSelectedCurrency();
      if (selectedCurrency != null) {
        try {
          final double to = double.parse(valueTo);
          final double from = to * selectedCurrency.value / selectedCurrency.nominal.toDouble();
          valueFrom = from.toString();
        } catch (e) {
          print(e);
        }
      }
    }
    return valueFrom;
  }
}
