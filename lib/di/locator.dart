import 'package:currency_converter/di/injector.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';

class Locator {
  static CurrencyProducer get currencyProducer => getIt<CurrencyProducer>();
}