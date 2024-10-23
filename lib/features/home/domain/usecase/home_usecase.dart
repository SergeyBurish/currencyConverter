abstract interface class CurrencyProducer{
    Future<String> getDefaultCurrency();
}

class HomeUsecase {
  static _HomeUsecaseImp? _homeUsecaseImp;

  static CurrencyProducer get currencyProducer {
    return _homeUsecaseImp ?? (
      _homeUsecaseImp = _HomeUsecaseImp()
    );
  }
}

class _HomeUsecaseImp implements CurrencyProducer{
  @override
  Future<String> getDefaultCurrency() {
    return Future.delayed(const Duration(seconds: 1), () => "usd");
  }
}