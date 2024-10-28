import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';

abstract interface class CurrencyProducer{
    Future<CurrencyEntity?> getDefaultCurrency();
    Future<List<CurrencyEntity>?> getCurrenciesList();
}

abstract interface class CurrencyRepository{
    Future<CurrenciesNotch?> getCurrenciesNotch();
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
}
