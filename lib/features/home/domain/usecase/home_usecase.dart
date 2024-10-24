import 'package:currency_converter/features/home/domain/entity/currencies_notch.dart';

abstract interface class CurrencyProducer{
    Future<String> getDefaultCurrency();
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
  Future<String> getDefaultCurrency() async {
    await repository.getCurrenciesNotch();
    return Future.delayed(const Duration(seconds: 1), () => "usd");
  }
}
